require 'minitest/autorun'

require_relative 'text'

class TestText < MiniTest::Test
  def setup
    @file = File.open("sample_text.txt", "rw")
    yield(@file.read)
  end

  # def teardown
  #   @file.close
  # end
end
