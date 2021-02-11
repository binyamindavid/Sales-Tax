class InitSource
  def initialize(input_source:)
    @input_source = input_source
  end

  def file_data
    File.open(@input_source).readlines.map(&:chomp)
  end
end
