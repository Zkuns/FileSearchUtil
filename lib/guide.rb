require 'SearchFileUtil'
require 'checkhelp'
class Guide
  include CheckHelp
  def launch

      inputs = get_action
      action(inputs)

  end

  def action inputs
    util = SearchFileUtil.new
    if inputs[:Recursion]=='yes'||inputs[:Recursion]=='y'
      util.search_file_recursion(inputs[:FileName],inputs[:KeyWord],inputs[:max],inputs[:min])
    else
      puts inputs.inspect
      util.search_file(inputs[:FileName],inputs[:KeyWord],inputs[:max],inputs[:min])
    end
  end

  def get_action
    inputs={}
    get_name inputs
    get_key inputs
    get_r inputs
    get_size inputs
    puts "you choice Filename:#{inputs[:FileName]},KeyWord:#{inputs[:KeyWord]}"
    inputs
  end
  def get_name inputs
    until fileisvalid?inputs[:FileName]
      puts ">FileName:"
      print ">"
      inputs[:FileName] = gets.chomp 
    end
  end
  def get_key inputs
    puts ">KeyWord:"
    print ">"
    inputs[:KeyWord] = gets.chomp
    puts inputs[:KeyWord]
    inputs[:KeyWord] = /.*#{inputs[:KeyWord]}.*/ 

  end
  def get_r inputs
    puts ">Recursion?(y/n or yes/no)"
    until inputisvalid? inputs[:Recursion]
      print ">"
      inputs[:Recursion] = gets.chomp
    end    
  end
  def get_size inputs
    until sizevalid?(inputs[:max],inputs[:min])
      puts ">FilemaxSize:(defaut is infinite,MB)"
      print ">"
      inputs[:max] = gets().chomp
      puts ">FileminSize:(defaut is 0,MB)"
      print ">"
      inputs[:min] = gets().chomp
    end
  end
end