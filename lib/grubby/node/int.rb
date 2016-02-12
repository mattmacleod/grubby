module Grubby
  class Node
    class Int
      attr_reader :val

      def initialize(val)
        @val = val
      end

      def to_go
        "#{val}"
      end
    end
  end
end
