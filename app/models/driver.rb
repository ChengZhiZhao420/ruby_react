class Driver < ApplicationRecord
    after_create_commit -> { broadcast_append_to "drivers" } # , partial: "drivers/driver", locals: { driver: self } can be ignore
    after_destroy_commit  -> { broadcast_remove_to "drivers" }

    def self.ransackable_attributes(auth_object = nil)
        # List the attributes you want to be searchable
        %w[authNo driverName]
    end

    def self.ransackable_associations(auth_object = nil)
        # List the associations you want to be searchable
        %w[customer shipment]
    end
end
