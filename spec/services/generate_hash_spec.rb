require 'json'
require './lib/src/service/generate_hash'

describe Lib::Src::Service::GenerateHash do
  it "open a file successful with a valid file path" do
    generated_log_hash = Lib::Src::Service::GenerateHash.new(
      File.read('./spec/fixtures/webserver.log')
    ).process

    expect(generated_log_hash).to eq(
      JSON.parse(File.read('spec/fixtures/generated_hash.json'))
    )
  end

  context "unsuccessful to generate a" do
    # It's possible to handle this issue by checking the file data.
    # For example, with a regex or something else, we can return a message for the user to show what's the problem.
    # As I hadn't enough time, I didn't do it that.
    # So this test doesn't make sense, but I add it because I used TDD.
    it "valid log has" do
      generated_log_hash = Lib::Src::Service::GenerateHash.new(
        'invalid data'
      ).process

      expect(generated_log_hash).to eq({"invalid"=>["data"]})
    end

    it "without a file data" do
      expect {
        Lib::Src::Service::GenerateHash.new(
          nil
        ).process
      }.to raise_error(NoMethodError)
    end
  end
end