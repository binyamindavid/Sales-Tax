require_relative "../lib/initSource"
require_relative "../lib/Product"

RSpec.describe "#Main" do
  let(:exec) { File.expand_path("../main.rb", File.dirname(__FILE__)) }

  file_name = "./factories/user_input.txt"
  initial_products = []

  context "require file on load" do
    it "must require a file name when loading app" do
      expect(file_name).not_to be_empty
    end

    it "give ArgumentError if no input file is given" do
      expect { InitSource.new }.to raise_error(ArgumentError)
    end


    it "does not raise if #initial_products are passed" do
      expect { Product.new(initial_products).line_items }.not_to raise_error
    end
  end
end
