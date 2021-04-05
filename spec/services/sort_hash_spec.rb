# frozen_string_literal: true

require 'json'
require './lib/src/service/sort_hash'

describe Lib::Src::Service::SortHash do
  context 'successful sort a log hash' do
    it 'sorted base on all views count' do
      generated_log_hash = Lib::Src::Service::Parser.new(
        './spec/fixtures/webserver.log'
      ).process

      sorted_log_hash = Lib::Src::Service::SortHash.new(
        generated_log_hash
      ).process

      # check the first items to make sure the sorting is working well
      expect(sorted_log_hash.values[0]).to eq(
        JSON.parse(File.read('spec/fixtures/generated_hash.json')).values[0]
      )
    end

    it 'sorted base on uniq views count' do
      generated_log_hash = Lib::Src::Service::Parser.new(
        './spec/fixtures/webserver.log'
      ).process

      sorted_log_hash = Lib::Src::Service::SortHash.new(
        generated_log_hash,
        true
      ).process

      # check the first items to make sure the sorting is working well
      expect(sorted_log_hash.values[0]).to eq(
        JSON.parse(File.read('spec/fixtures/generated_hash.json')).values[1]
      )
    end
  end

  context 'unsuccessful to sort a hash log' do
    it 'with invalid hash log' do
      expect {
        Lib::Src::Service::SortHash.new(
          'invalid hash'
        ).process
      }.to raise_error(NoMethodError)
    end

    it 'without a hash log' do
      expect {
        Lib::Src::Service::SortHash.new(
          nil
        ).process
      }.to raise_error(NoMethodError)
    end
  end
end
