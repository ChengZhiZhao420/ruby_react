class Driver < ApplicationRecord
    after_create_commit -> { broadcast_append_to "drivers" } # , partial: "drivers/driver", locals: { driver: self } can be ignore
    after_destroy_commit  -> { broadcast_remove_to "drivers" }

end
