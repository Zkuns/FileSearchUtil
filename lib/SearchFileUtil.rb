class SearchFileUtil
  def search_file_recursion(filename,regex,max,min)
    if File.directory?(filename)&&!(filename.split('/')[-1]=~/^\.{1,2}$/||filename.split('/')[-1]=~/^\./)
      puts filename if filename.split('/')[-1]=~regex
      path=File.expand_path(filename)
      Dir.entries(filename).each do |filename|
        filename=File.join(path,filename)
        search_file_recursion(filename,regex,max,min)
      end
    else
      if max.to_i==0&&min.to_i==0
        puts filename if filename.split('/')[-1]=~regex&&File.size(filename)        
      else
        puts filename if filename.split('/')[-1]=~regex&&File.size(filename).between?(min.to_i*
          1024**2,max.to_i*1024**2)
      end
    end
  end
  def search_file(filename,regex,max,min)
    path=File.expand_path(filename)    
    Dir.entries(filename).each do |filename|
      filename=File.join(path,filename)
        if max.to_i==0&&min.to_i==0
          puts filename if filename.split('/')[-1]=~regex&&File.size(filename)        
        else
          puts filename if filename.split('/')[-1]=~regex&&File.size(filename).between?(min.to_i*
            1024**2,max.to_i*1024**2)
        end
    end
  end
end