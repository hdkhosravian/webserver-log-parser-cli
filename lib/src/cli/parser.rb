# frozen_string_literal: true

module Lib
  module Src
    module Cli
      class Parser < ::Dry::CLI::Command
        desc 'Webserver Log Parser'

        option :file_path, required: false, default: 'webserver.log', desc: 'path to the log file'
        option :uniq, required: false, default: 'false', desc: 'sort base on uniq views'

        def call(file_path:, uniq:, **)
          # if the file didn't exist just show an error about it to the user
          return unless file_exist?(file_path)

          # Generate an hash from logs for easier handling
          generated_log_hash = file_parser(file_path, uniq?(uniq))
          print_result(generated_log_hash)
        end

        private

        def file_exist?(file_path)
          Lib::Src::Service::Rules::FilePath.new(file_path).process
        end

        def file_parser(file_path, uniq)
          Lib::Src::Service::Parser.new(file_path, uniq).process
        end

        def print_result(generated_log_hash)
          generated_log_hash.each do |key, value|
            Lib::Src::Service::PrintResult.new(key, value).process
          end
        end

        # argumants from commands line are string, for booleans we have to convert them
        def uniq?(uniq)
          { 'false': false, 'true': true }[uniq.to_sym]
        end
      end
    end
  end
end
