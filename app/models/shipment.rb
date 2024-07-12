class Shipment
    attr_accessor :bols
    def self.get_bol
        ActiveRecord::Base.connected_to(database: :ulcdbtest) do
            self.bols = ActiveRecord::Base.connection.execute("SELECT * FROM some_table")
        end
    end
end
