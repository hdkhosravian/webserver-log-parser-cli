require './lib/src/service/rules/file_path'

describe Lib::Src::Service::Rules::FilePath do
  it "successful with a valid file path" do
    file_path = Lib::Src::Service::Rules::FilePath.new(
      './spec/fixtures/webserver.log'
    ).process

    expect(file_path).to eq(true)
  end

  context "unsuccessful call service" do
    it "an invalid file path" do
      file_path = Lib::Src::Service::Rules::FilePath.new(
        'invalid path'
      ).process

      expect(file_path).to eq(false)
    end

    it "without a file path" do
      expect {
        Lib::Src::Service::Rules::FilePath.new(
          nil
        ).process
      }.to raise_error(TypeError)
    end
  end
end