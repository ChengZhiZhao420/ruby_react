class CustomerBolShipmentsController < ApplicationController
    def index
        @customer_bol_shipments = CustomerBolShipment.with_confirm_date.ordered_by_ship_date.with_ship_date.all
    end
    
end
