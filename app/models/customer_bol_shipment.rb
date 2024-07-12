class CustomerBolShipment < ActiveRecord::Base
    self.abstract_class = true
    self.table_name = 'CustomerBOLShipment'
    #has_many :pick_order_headers, foreign_key: "BOLNO", primary_key: "BOLNO"
  
    connects_to database: { writing: :ulcdbtest, reading: :ulcdbtest }
  
    scope :with_confirm_date, -> { where(CONFIRMDATE: Time.utc(1900, 1, 1, 0, 0, 0)) }
    scope :with_ship_date, -> { where.not(BOLSHIPDATE: Time.utc(1900, 1, 1, 0, 0, 0)) }
    scope :ordered_by_ship_date, -> { order(:BOLSHIPDATE) }

    def self.ransackable_attributes(auth_object = nil)
      # List the attributes you want to be searchable
      %w[BOLNOCOMPANY REFERENCE BOLSHIPDATE SCHEDULEDPICKUPDATE ]
    end

    def self.ransackable_associations(auth_object = nil)
      # List the associations you want to be searchable
      %w[customer shipment]
    end
  end
  