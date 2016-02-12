require_relative 'node/begin'
require_relative 'node/send'
require_relative 'node/int'
require_relative 'node/str'
require_relative 'node/dstr'

module Grubby
  class Node
    def self.from(node)
      case node.type
      when :begin
        Begin.new(node.children)
      when :send
        Send.new(*node.children)
      when :int
        Int.new(*node.children)
      when :str
        Str.new(*node.children)
      when :dstr
        Dstr.new(node.children)
      else
        fail "FATAL: unsupported node #{node}"
      end
    end
  end
end
