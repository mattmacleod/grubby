require 'bundler'
Bundler.require

require_relative 'lib/grubby'

source = File.open(File.join(__dir__, 'test', 'test.rb')).read

buffer = Parser::Source::Buffer.new('(string)')
buffer.source = File.open(File.join(__dir__, 'test', 'test.rb')).read

ast_builder = Astrolabe::Builder.new
parser = Parser::Ruby23.new(ast_builder)

parsed = Grubby::Node.from(parser.parse(buffer))
# binding.pry
# ap parsed.inspect
# puts
# puts parsed.to_go

puts <<-EOF
package main

import "fmt"

func main() {
  #{ parsed.to_go }
}
EOF
