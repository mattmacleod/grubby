module Grubby
  class Node
    class Str
      attr_reader :val

      def initialize(val)
        @val = val
      end

      def to_go
        "\"#{val}\""
      end
    end
  end
end
