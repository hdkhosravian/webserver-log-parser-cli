require './lib/src/service/open_file'

describe Lib::Src::Service::OpenFile do
  it "successful with a valid file path" do
    file_data = Lib::Src::Service::OpenFile.new(
      './spec/fixtures/webserver.log'
    ).process

    expect(file_data).to eq(File.read('./spec/fixtures/webserver.log'))
  end

  context "unsuccessful to open a file" do
    it "because of an invalid file path" do
      expect {
        Lib::Src::Service::OpenFile.new(
          'invalid path'
        ).process
      }.to raise_error(Errno::ENOENT)
    end

    it "without a file path" do
      expect {
        Lib::Src::Service::OpenFile.new(
          nil
        ).process
      }.to raise_error(TypeError)
    end
  end
end