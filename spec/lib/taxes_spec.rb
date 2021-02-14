require_relative "../../lib/Taxes"

RSpec.describe Taxes do

    product = {qty: 1, name: "Imported bottle of perfume", price: 47.5, imported: true, tax_exempt: false}
    not_imported = {qty: 1, name: "book", price:12.49, imported: false, tax_exempt: true}

    context "calculator correct tax" do

        it "should calculate basic tax at 10%" do
            basic_tax = Taxes.new(product).basic_tax
            expect(basic_tax).to eq(4.75)
        end

        it "should calculate import tax at 5%" do
            basic_tax = Taxes.new(product).import_tax
            expect(basic_tax).to eq(2.40)
        end

        it "should not calculate basic tax at 10% for except products" do
            basic_tax = Taxes.new(not_imported).basic_tax
            expect(basic_tax).to eq(0)
        end

        it "should not calculate import tax at 5% for no imports" do
            basic_tax = Taxes.new(not_imported).import_tax
            expect(basic_tax).to eq(0)
        end

    end
end