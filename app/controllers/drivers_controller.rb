class DriversController < ApplicationController
    def index
        @drivers = Driver.all
    end

    def new
        @driver = Driver.new
    end

    def show
        get_driver
        respond_to do |format|
          format.html {render partial: 'details', locals: {driver: @driver}}
          format.turbo_stream
        end
    end

    def create
        @driver = Driver.new(driver_params)
        respond_to do |format|
          if @driver.save
            format.turbo_stream
            format.html { redirect_to @driver }

          else
            format.html { render :new, status: :unprocessable_entity }
            format.turbo_stream { render turbo_stream: turbo_stream.replace('new_driver', partial: 'form', locals: { driver: @driver }), status: :unprocessable_entity }
          end
        end
    end

    def edit
        get_driver
    end

    def update
        get_driver
        if @driver.update(driver_params)
          flash[:success] = "Object was successfully updated"
          redirect_to @driver
        else
          flash[:error] = "Something went wrong"
          render 'edit'
        end
    end

    def destroy
      get_driver
      respond_to do |format|
        @driver.destroy
        format.html { redirect_to drivers_path, notice: "Quote was successfully destroyed." }
        format.turbo_stream
      end
    end
    
    private
        def get_driver
            @driver = Driver.find(
            params[:id]
            )
        end

        def driver_params
            params.require(:driver).permit(:driverName, :authNo, :licence, :securityCheckIn, :counterCheckIn, :dockDoor)
        end
    
end
