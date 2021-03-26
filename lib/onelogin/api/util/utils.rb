require 'date'

module OneLogin
    module Api
      module Util
        module Utils

            def str2bool(s)
              if s == nil
                return nil
              else
                return ["yes", "true", "t", "1"].include?(s.to_s.downcase)
              end
            end

            def str2date(s)
              DateTime.parse(s) rescue nil
            end 
            
            def str2int(s)
              Integer(s) rescue nil
            end      

        end
    end
  end
end