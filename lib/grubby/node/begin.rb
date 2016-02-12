module Grubby
  class Node
    class Begin
      attr_reader :children

      def initialize(children)
        @children = children.map { |c| Node.from(c) }
      end

      def to_go
        children.map(&:to_go).join("\n")
      end
    end
  end
end
