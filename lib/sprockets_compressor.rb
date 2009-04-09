module Sprockets
  class Concatenation
    
    def save_to_with_compress(filename)
      status = save_to_without_compress(filename)
      
      compressor = Dir.glob("#{File.dirname(__FILE__)}/../vendor/yuicompressor-*.jar")
      %x{ java -jar #{compressor} -o #{filename} #{filename} }
      
      status
    end
    
    alias_method_chain :save_to, :compress
    
  end
end