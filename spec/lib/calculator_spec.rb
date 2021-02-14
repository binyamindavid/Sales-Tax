require_relative "../../lib/Calculator"

RSpec.describe Calculator do

    product = [{qty: 1, name: "Imported bottle of perfume", price: 47.5, imported: true, tax_exempt: false}]
    total_taxes = 7.15
    total_inc_taxes  = 54.65


    context "calculator" do

        it "should display product product price incl taxes" do
            incl_taxes = Calculator.new(product).calculate_tax
            expect(incl_taxes).to eq(["1 x Imported bottle of perfume at 54.65"])
        end

        it "should get bill total tax amount" do
            total_tax = Calculator.new(product).add_to_tax(total_taxes)
            expect(total_tax).to eq(7.15)
        end

        it "should get bill total amount" do
            total_amout = Calculator.new(product).add_to_total(total_inc_taxes)
            expect(total_amout).to eq(54.65)
        end

    end
end