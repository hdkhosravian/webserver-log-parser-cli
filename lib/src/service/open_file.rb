# frozen_string_literal: true

module Lib
  module Src
    module Service
      class OpenFile
        attr_reader :file_path

        def initialize(file_path)
          @file_path = file_path
        end

        def process
          read_data_file
        end

        private

        def read_data_file
          File.read(file_path)
        end
      end
    end
  end
end
