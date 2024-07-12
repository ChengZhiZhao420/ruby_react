import { Application } from "@hotwired/stimulus"
import ResetFormController from "./reset_form_controller"
import SubmitFormController from "./submit_form_controller"
import ShowFrameController from "./show_frame_controller"
import DriverFilterController from "./driver_filter_controller"

const application = Application.start()
application.register("reset_form", ResetFormController)
application.register("submit_form", SubmitFormController)
application.register("show_frame", ShowFrameController)
application.register("driver_filter", DriverFilterController)


// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }
