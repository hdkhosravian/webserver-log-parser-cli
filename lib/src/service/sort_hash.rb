module Lib
  module Src
    module Service
      class SortHash
        attr_reader :generated_log_hash, :uniq

        def initialize(generated_log_hash, uniq = false)
          @generated_log_hash  = generated_log_hash
          @uniq  = uniq
        end

        def process
          sort_hash
        end

        private

        def sort_hash
          sorted_hash = generated_log_hash.sort_by do |_key, value|
            uniq ? -value.uniq.count : -value.count 
          end

          sorted_hash.to_h
        end
      end
    end
  end
end