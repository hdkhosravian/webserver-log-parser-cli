# frozen_string_literal: true

require 'bundler/setup'
require 'dry/cli'

# import src files
Dir.glob('./lib/**/*.rb').each { |f| require f }

module Lib
  module Parser
    extend Dry::CLI::Registry
    extend ::Lib::Src

    # default cli
    register 'parser', ::Lib::Src::Cli::Parser, aliases: ['-p', '--p', '--parser']
    # print project version
    register 'version', ::Lib::Src::Cli::Version, aliases: ['-v', '--v', '--version']
  end
end
