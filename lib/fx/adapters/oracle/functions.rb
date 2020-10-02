require "fx/function"

module Fx
  module Adapters
    class Oracle
      # Fetches defined functions from the oracle connection.
      # @api private
      class Functions
        # The SQL query used by F(x) to retrieve the functions considered
        # dumpable into `db/schema.rb`.
        FUNCTIONS_WITH_DEFINITIONS_QUERY = <<-EOS.freeze
          SELECT
            user_source.name AS name,
            CONCAT('CREATE OR REPLACE ', LISTAGG(user_source.text, ' ') WITHIN GROUP (ORDER BY user_source.line)) AS definition
          FROM user_source
          WHERE user_source.type = 'FUNCTION'
          GROUP BY user_source.name;
        EOS

        # Wraps #all as a static facade.
        #
        # @return [Array<Fx::Function>]
        def self.all(*args)
          new(*args).all
        end

        def initialize(connection)
          @connection = connection
        end

        # All of the functions that this connection has defined.
        #
        # @return [Array<Fx::Function>]
        def all
          functions_from_oracle.map { |function| to_fx_function(function) }
        end

        private

        attr_reader :connection

        def functions_from_oracle
          connection.execute(FUNCTIONS_WITH_DEFINITIONS_QUERY)
        end

        def to_fx_function(result)
          Fx::Function.new(result)
        end
      end
    end
  end
end
