module Grubby
  class Node
    class Dstr
      attr_reader :parts

      def initialize(parts)
        @parts = parts.map { |p| Node.from(p) }
      end

      def to_go
        "fmt.Sprintf(\"#{ '%v' * parts.length}\", #{ parts.map(&:to_go).join(',') })"
      end
    end
  end
end
