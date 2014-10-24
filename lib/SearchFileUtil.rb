class SearchFileUtil
  def search_file_recursion(filename,regex)
    regex = /.*#{regex}.*/
    if File.directory?(filename)&&!(filename=~/\.{1,2}/)
      puts filename if filename.split('/')[-1]=~regex
      path=File.expand_path(filename)
      
      Dir.entries(filename).each do |filename|
        filename=File.join(path,filename)
        search_file_recursion(filename,regex)
      end
    else
      puts filename if filename.split('/')[-1]=~regex
    end
  end
  def search_file(filename,regex)
    path=File.expand_path(filename)    
    Dir.entries(filename).each do |filename|
      filename=File.join(path,filename)
      puts filename if filename.split('/')[-1]=~regex
    end
  end
end