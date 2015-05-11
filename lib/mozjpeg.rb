require "mozjpeg/version"
require 'os'

module Mozjpeg

  def self.supported?
    cjpeg_path rescue false
  end

  def self.cjpeg_path
    base_path = File.expand_path(File.join(__dir__, '../vendor/mozjpeg'))
    
    mozjpeg_path = begin
      if OS.windows?
        'win/cjpeg.exe'
      elsif OS.mac? && OS.bits == 64
        'darwin/cjpeg'
      elsif OS.linux? && os.bits == 64
        'linux/cjpeg'
      else
        raise "MozJPEG for your platform was not found."
      end
    end

    File.join(base_path, mozjpeg_path)
  end

  # TODO improve
  # Accepts instances of File
  def self.compress(src, dst, options = {})
    args = options.fetch(:arguments, '-quality 70 -quant-table 2 -notrellis')
    return `"#{Mozjpeg.cjpeg_path}" #{args} -outfile "#{dst.path}" "#{src.path}" 2>&1`
  end

end
