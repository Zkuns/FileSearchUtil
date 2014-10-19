puts "FileName:"
file_name = gets.chomp
puts "KeyWord:"
key = gets.chomp
regex = /.*#{key}.*/
def puts_file_name (filename,regex)
  if File.directory?(filename)&&!(filename=~/\.{1,2}/)
    puts filename if filename.split('/')[-1]=~regex
    path=File.expand_path(filename)
    
    Dir.entries(filename).each do |filename|
      filename=path+'/'+filename
      puts_file_name(filename,regex)
    end
  else
    puts filename if filename.split('/')[-1]=~regex
  end
end

puts_file_name file_name,regex