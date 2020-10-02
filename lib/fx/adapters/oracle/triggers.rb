require "fx/trigger"

module Fx
  module Adapters
    class Oracle
      # Fetches defined triggers from the oracle connection.
      # @api private
      class Triggers
        # TODO: Look the postgres adapter example to define here
        # the query and method to retrieve from oracle database
        # triggers considered dumpable into db/schema.
        # The query must return two attributes, name and definition
        TRIGGERS_WITH_DEFINITIONS_QUERY = <<-EOS.freeze
        EOS

        # Wraps #all as a static facade.
        #
        # @return [Array<Fx::Trigger>]
        def self.all(*args)
          new(*args).all
        end

        def initialize(connection)
          @connection = connection
        end

        # All of the triggers that this connection has defined.
        #
        # @return [Array<Fx::Trigger>]
        def all
          triggers_from_oracle.map { |trigger| to_fx_trigger(trigger) }
        end

        private

        attr_reader :connection

        def triggers_from_postgres
          # TODO: uncomment below line after define the query
          # to retrieve triggers from oracle database,
          # and removes the line returning and empty array
          # connection.execute(TRIGGERS_WITH_DEFINITIONS_QUERY)
          []
        end

        def to_fx_trigger(result)
          Fx::Trigger.new(result)
        end
      end
    end
  end
end
