# frozen_string_literal: true

module Lib
  module Src
    module Service
      module Rules
        # Check to make sure the file is present
        class FilePath
          attr_reader :file_path

          def initialize(file_path)
            @file_path = file_path
          end

          def process
            file_exist?
          end

          private

          def file_exist?
            unless File.exist?(file_path)
              # I prefer to use I18N, but for now, I'm using hardcoded English message here.
              puts "ERROR: #{file_path} is not readable, please make sure the file path is correct"
              return false
            end

            true
          end
        end
      end
    end
  end
end
