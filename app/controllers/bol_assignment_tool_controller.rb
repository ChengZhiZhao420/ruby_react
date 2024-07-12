class BolAssignmentToolController < ApplicationController
    def index
      
        driver_id = params[:custom_field]
        Rails.logger.debug "Drivers11: #{params[:custom_field]}"
        if driver_id.present?
            bols = LoadingList.where(driver:driver_id).pluck(:bolno)
            
            @k = Driver.all.ransack(params[:q])
            @drivers = @k.result.page(params[:page]).per(10) 

            @q = CustomerBolShipment.where(BOLNO:bols).with_confirm_date.ordered_by_ship_date.with_ship_date.all.ransack(params[:q])
            @customer_bol_shipments = @q.result.page(params[:page]).per(10)
        else
            session[:driver_id] = nil
            @k = Driver.all.ransack(params[:q])
            @drivers = @k.result.page(params[:page]).per(10) 

            @q = CustomerBolShipment.with_confirm_date.ordered_by_ship_date.with_ship_date.all.ransack(params[:q])
            @customer_bol_shipments = @q.result.page(params[:page]).per(10)
        end
        
        #Rails.logger.debug "Drivers: #{@drivers.inspect}"
        #Rails.logger.debug "Customer BOL Shipments: #{@customer_bol_shipments.inspect}"

        respond_to do |format|
            format.html # default format, if necessary
            format.turbo_stream
        end
    end

    def assignLoad
        driver = params[:driver_ids][0]
        for bolno in params[:customer_bol_shipment_ids]
            shipment = LoadingList.new(driver: driver, bolno: bolno)
            shipment.save
        end
    end
    
end
