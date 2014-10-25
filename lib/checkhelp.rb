module CheckHelp
  class Config
    @@inputs=['y','n','yes','no']
    def self.inputs
      @@inputs
    end
  end

  def inputisvalid? input
    case 
    when input==''
      puts 'It can\'t be blank'
    when input==nil
    when (!Config.inputs.include?input)
      puts 'Please puts '+Config.inputs.join(',')+' .'
    end
    input!=''&&input!=nil&&(Config.inputs.include?input)
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

  def sizevalid?(max,min)
    case
    when max==nil||min==nil     
    when (max)!~/^\d*$/||(min)!~/^\d*$/
      puts 'Max and min must be number' 
    when max.to_i<min.to_i
      puts 'Min can\'t bigger than max'
    end
    max=~/^\d*$/&&min=~/^\d*$/&&max.to_i>=min.to_i
  end
end