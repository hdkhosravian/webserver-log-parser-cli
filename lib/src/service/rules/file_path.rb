module Lib
  module Src
    module Service
      module Rules
        # Check to make sure the file is present
        class FilePath
          attr_reader :file_path

          def initialize(file_path)
            @file_path  = file_path
          end

          def process
            file_exist?
          end

          private

          def file_exist?
            unless File.exists?(file_path)
              puts "ERROR: #{file_path} is not present"
              return false
            end

            true
          end
        end
      end
    end
  end
end
          