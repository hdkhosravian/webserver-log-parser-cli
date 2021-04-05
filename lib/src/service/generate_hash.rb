module Lib
  module Src
    module Service
      class GenerateHash
        attr_reader :file_data
        
        def initialize(file_data)
          @file_data = file_data
        end

        def process
          generate_grouped_hash
        end

        private

        def split_logs
          file_data.split("\n")
        end

        def split_view
          split_logs.map {|data| data.split(" ") }
        end

        def generate_grouped_hash
          grouped_data = split_view.each_with_object({}) do |(key, value), log| 
            log[key] = log[key].to_a.concat([value])
          end
        end
      end
    end
  end
end
