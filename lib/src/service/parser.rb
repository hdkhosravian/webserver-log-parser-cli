# frozen_string_literal: true

module Lib
  module Src
    module Service
      class Parser
        attr_reader :file_path, :uniq, :file_data, :generate_log_hash, :sort_hash

        def initialize(file_path, uniq = false)
          @file_path = file_path
          @generate_log_hash = {}
          @sort_hash  = {}
          @file_data  = ''
          @uniq = uniq
        end

        def process
          open_file
          generate_log_hash
          sort_hash
        end

        private

        def open_file
          @file_data = Lib::Src::Service::OpenFile.new(file_path).process
        end

        def generate_log_hash
          @generate_log_hash = Lib::Src::Service::GenerateHash.new(open_file).process
        end

        def sort_hash
          @sort_hash = Lib::Src::Service::SortHash.new(generate_log_hash, uniq).process
        end
      end
    end
  end
end
