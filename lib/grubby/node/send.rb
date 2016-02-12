module Grubby
  class Node
    class Send
      attr_reader :lval, :op, :rval

      def initialize(lval, op, rval = nil)
        @lval = lval ? Node.from(lval) : :KERNEL
        @op = op
        @rval = Node.from(rval) if rval
      end

      def to_go
        case lval

        when :KERNEL
          case op
          when :puts
            "fmt.Printf(\"%v\\n\", #{rval.to_go})\n"
          else
            fail "FATAL: Don't know how to '#{op}' on Kernel'"
          end

        when Int
          case op
          when :+, :-, :/, :*
            "#{lval.to_go} #{op} #{rval.to_go}"
          when :succ
            "#{lval.to_go} + 1"
          else
            fail "FATAL: Don't know how to '#{op}' on '#{lval}'"
          end

        else
          fail "FATAL: unsupported message target #{lval}"
        end
      end
    end
  end
end
