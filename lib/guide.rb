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
    util.search_file_recursion(inputs[:FileName],inputs[:KeyWord])
  end

  def get_action
    inputs={}
    until fileisvalid?inputs[:FileName]
      puts ">FileName:"
      print ">"
      inputs[:FileName] = gets.chomp 
    end
    puts ">KeyWord:"
    print ">"
    inputs[:KeyWord] = gets.chomp
    puts ">Recursion?(y/n or yes/no)"
    print ">"
    until 
      inputs[:Recursion] = gets.chomp
    end
    puts "you choice Filename:#{inputs[:FileName]},KeyWord:#{inputs[:KeyWord]}"
    inputs
  end


end