require_relative "../../lib/initSource"

RSpec.describe InitSource do
  context "file_data" do
    context "when initSource is included and file name" do
      it "mock input file" do
        filename = "./factories/user_input.txt"
        content = "1 book at 12.49"
        allow(File).to receive(:open).and_yield(StringIO.new(content))

        expect(StringIO.new(content).read).to eq(content)

        result = ""
        File.open(filename, "r") { |f| result = f.read }
        expect(result).to eq(content)
      end
    end
  end
end
