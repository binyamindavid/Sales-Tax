require_relative "../lib/initSource"

RSpec.describe "#main" do
  let(:exec) { File.expand_path("../main.rb", File.dirname(__FILE__)) }

  file_name = "./factories/user_input.txt"

  context "#require on load" do
    it "must require a file name when loading app" do
      expect(file_name).not_to be_empty
    end

    it "give ArgumentError if no input file is given" do
      expect { InitSource.new }.to raise_error(ArgumentError)
    end
  end
end
