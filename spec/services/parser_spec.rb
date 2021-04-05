require 'json'
require './lib/src/service/generate_hash'

describe Lib::Src::Service::Parser do
  context "successful parse a log file" do
    it "sorted base on all views count" do
      generated_log_hash = Lib::Src::Service::Parser.new(
        './spec/fixtures/webserver.log'
      ).process

      # check the first items to make sure the sorting is working well
      expect(generated_log_hash.values[0]).to eq(
        JSON.parse(File.read('spec/fixtures/generated_hash.json')).values[0]
      )
    end

    it "sorted base on uniq views count" do
      generated_log_hash = Lib::Src::Service::Parser.new(
        './spec/fixtures/webserver.log',
        true
      ).process

      # check the first items to make sure the sorting is working well
      expect(generated_log_hash.values[0]).to eq(
        JSON.parse(File.read('spec/fixtures/generated_hash.json')).values[1]
      )
    end
  end

  context "unsuccessful to parse a log file" do
    it "with invalid file path" do
      expect {
        Lib::Src::Service::Parser.new(
          'invalid path'
        ).process
      }.to raise_error(Errno::ENOENT)
    end

    it "without file path" do
      expect {
        Lib::Src::Service::Parser.new(
          nil
        ).process
      }.to raise_error(TypeError)
    end
  end
end