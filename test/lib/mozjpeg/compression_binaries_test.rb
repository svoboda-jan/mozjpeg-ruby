require_relative '../../test_helper'
require 'tempfile'

class CompressionBinariesTest < Minitest::Test

  def setup
    @tmp_file = Tempfile.new(['compressed', '.jpg'])
    @uncompressed_file = File.open(File.expand_path(File.join(__dir__, '../../fixtures/rainy-window.jpg')))
  end

  def test_mozjped_support 
    assert Mozjpeg.supported?, "MozJPEG is not supported on this system."
  end

  def test_that_mozjpeg_runs_and_compresses_jpeg_image
    result = Mozjpeg.compress @uncompressed_file, @tmp_file, arguments: '-quality 70 -quant-table 2 -notrellis'
    puts "Compressed to #{size_in_mb @tmp_file.size} MB from #{size_in_mb @uncompressed_file.size} MB"
    assert @tmp_file.size > 100_000, "Resulting image suspiciously small. (#{@tmp_file.size} bytes)\n\nResult:\n#{result}"
  end

end
