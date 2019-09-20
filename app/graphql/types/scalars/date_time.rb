module Types
  module Scalars
    class DateTime < Base
      def self.coerce_input(value, _ctx)
        Time.zone.parse(value)
      end

      def self.coerce_result(value, _ctx)
        value.strftime('%Y-%m-%d %H:%M:%S')
      end
    end
  end
end
