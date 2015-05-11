#$VERBOSE = true

require 'minitest/autorun'
#require 'minitest/pride'
require 'pp'

require File.expand_path('../../lib/mozjpeg.rb', __FILE__)

def size_in_mb(bytes)
  (bytes.to_f/1024/1024).round(2)
end
