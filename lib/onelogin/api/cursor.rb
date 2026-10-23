require 'onelogin/api/apiexception'
require 'onelogin/api/util'

# Cursor
#
# Used for paginating requests to the OneLogin API
#
# Returns an enumerable object
class Cursor
  include Enumerable
  include OneLogin::Api::Util

  # Create a new instance of the Cursor.
  #
  # @param url [String] The url of the API endpoint
  # @param options [Hash] Configuation options
  #
  def initialize(client, url, options = {})
    @client = client
    @url = url
    @options = options

    @model = options[:model]
    @headers = options[:headers] || {}
    @params = options[:params] || {}
    @max_results = options[:max_results]
    @container = options[:container] || 'data'
    @api_version = options[:api_version]

    @collection = []
    @after_cursor = options.fetch(:after_cursor, nil)
  end

  def each(start = 0, &proc)
    return to_enum(:each, start) unless block_given?

    Array(@collection[start..-1]).each do |item|
      if @model
        yield(@model.new(item))
      else
        yield(item)
      end
    end

    unless last?
      start = [@collection.size, start].max

      fetch_next_page

      each(start, &proc)
    end
  end

  private

  def fetch_next_page
    return fetch_next_v2_page if @api_version == 2

    @params = @params.merge(after_cursor: @after_cursor) if @after_cursor
    @client.prepare_token

    response = @client.class.get(
      @url,
      headers: request_headers,
      query: @params
    )

    json = response.parsed_response

    # HTTParty picks its parser from Content-Type, so a gateway or proxy error
    # page comes back as a String and every has_key? below would blow up with a
    # NoMethodError instead of a usable ApiException.
    if json.nil? || !json.is_a?(Hash)
      raise OneLogin::Api::ApiException.new("Response could not be parsed", response.code)
    elsif !json.has_key?(@container) && json.has_key?('status') && json["status"]["error"] == true
      raise OneLogin::Api::ApiException.new(extract_error_message_from_response(response), json["status"]["code"])
    elsif !json.has_key?(@container) && json.has_key?('statusCode')
      raise OneLogin::Api::ApiException.new(extract_error_message_from_response(response), json["statusCode"])
    else

      results = json[@container]
      if @container == "data"
        results = results.flatten
      end

      @collection += if results_remaining < results.size
        results.slice(0, results_remaining)
      else
        results
      end

      @after_cursor = after_cursor(json)
      @last_cursor_empty = @after_cursor.nil?
    end
  end

  # v2 returns a bare array and puts the next page's cursor in the After-Cursor
  # header, which is absent on the last page. The cursor already encodes the
  # filters and page size, and the API rejects a cursor sent alongside limit or
  # page, so follow-up requests send the cursor alone.
  def fetch_next_v2_page
    @client.prepare_token

    response = @client.class.get(
      @url,
      headers: request_headers,
      query: @after_cursor ? { cursor: @after_cursor } : @params
    )

    results = response.parsed_response

    unless response.code == 200 && results.is_a?(Array)
      message = results.is_a?(Hash) ? extract_error_message_from_response(response) : "Response could not be parsed"
      raise OneLogin::Api::ApiException.new(message, response.code)
    end

    @collection += if results_remaining < results.size
      results.slice(0, results_remaining)
    else
      results
    end

    @after_cursor = response.headers['after-cursor']
    @last_cursor_empty = @after_cursor.nil? || @after_cursor.empty?
  end

  # The headers were built when the cursor was, and prepare_token may have
  # refreshed the token since: a cursor enumerated later, or one whose pages
  # outlive the token. Take the current token from the client.
  def request_headers
    @headers.merge(@client.authorized_headers)
  end

  def after_cursor(json)
    value = nil
    if json.has_key?('pagination')
      value = json['pagination'].fetch('after_cursor', nil)
    elsif json.has_key?('afterCursor')
      value = json['afterCursor']
    end
    value
  end

  def results_remaining
    @max_results - @collection.size
  end

  def fetch_completed?
    return false unless @max_results

    @collection.size >= @max_results
  end

  def last?
    @last_cursor_empty || fetch_completed?
  end
end
