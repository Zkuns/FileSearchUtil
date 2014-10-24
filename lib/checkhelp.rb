module CheckHelp
  class config
    @@input=['y','n','yes','no']
    def self.input
      @@inputs
    end
  end
  def 
  end
  def fileisvalid? filename
    case 
    when filename==''
      puts 'filename can\'t be blank'
    when filename==nil

    when !(File.directory?filename)
      puts 'It\'s not a directory'
    end
    filename!=''&&filename!=nil&&(File.directory?filename)
  end
end