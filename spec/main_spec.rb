require_relative "../lib/initSource"
require_relative "../lib/products"

RSpec.describe "#main" do
  let(:exec) { File.expand_path("../main.rb", File.dirname(__FILE__)) }

  file_name = "./factories/user_input.txt"
  initial_products = []

  context "#require on load" do
    it "must require a file name when loading app" do
      expect(file_name).not_to be_empty
    end

    it "give ArgumentError if no input file is given" do
      expect { InitSource.new }.to raise_error(ArgumentError)
    end
  end

  context "initial_products gets parsed" do
    it "does not raise" do
      expect { Products.new(initial_products).line_items }.not_to raise_error
    end
  end
end
