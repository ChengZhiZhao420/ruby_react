import { Application } from "@hotwired/stimulus"
import ResetFormController from "./reset_form_controller"

const application = Application.start()
application.register("reset_form", ResetFormController)

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }
