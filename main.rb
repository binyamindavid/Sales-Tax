require_relative "./lib/initSource"

class Main
  attr_reader :file_name

  def initialize(file_name)
    file_name = file_name
  end

  file_name = ARGV[0]

  if ARGV.length != 1
    puts "No input given to calculate. Please include file name."
    exit
  end

  initial_products = InitSource.new(input_source: file_name).file_data

  initial_products.each do |line|
    puts line
    # test line items
  end
end
