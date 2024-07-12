class PickOrderHeader < ActiveRecord::Base
    self.abstract_class = true
    self.table_name = "PickOrderHeader"
    #belongs_to :customer_bol_shipment, foreign_key: "BOLNO", primary_key: "BOLNO"
    #connects_to database: { writing: :ulcdbtest, reading: :ulcdbtest }

end
