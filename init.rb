ROOTPATH=File.dirname(__FILE__)
$:.unshift(File.join("#{ROOTPATH}","lib"))
require 'guide'
guide = Guide.new
guide.launch