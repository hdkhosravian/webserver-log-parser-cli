# frozen_string_literal: true

module Lib
  module Src
    module Service
      class PrintResult
        attr_reader :key, :values

        def initialize(key, values)
          @key = key
          @values = values
        end

        def process
          print_result
        end

        private

        def print_result
          # I prefer to use I18N, but for now, I'm using hardcoded English message here.
          puts format(' %-30s | Views: %-8d | Uniq Views: %-8d', key, values.count, values.uniq.count)
        end
      end
    end
  end
end
