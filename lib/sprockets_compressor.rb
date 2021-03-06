begin
  require 'sprockets'
rescue LoadError => e
  e.message << " (You may need to install the sprockets gem)"
  raise e
end


module Sprockets
  
  @compression = false
  
  class << self
    attr_accessor :compression
  end
  
  class Concatenation
    
    def save_to_with_compress(filename)
      status = save_to_without_compress(filename)
      
      if Sprockets.compression
        compressor = Dir.glob(File.expand_path(File.join(File.dirname(__FILE__), '..', 'vendor', 'yuicompressor-*.jar')))
        %x{ java -jar #{compressor} --charset utf8 -o #{filename} #{filename} }
      end
      
      status
    end
    
    alias_method_chain :save_to, :compress
    
  end
end