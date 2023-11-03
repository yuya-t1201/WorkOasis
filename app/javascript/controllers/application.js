import { Application } from "@hotwired/stimulus"
import { Autocomplete } from "stimulus-autocomplete"
import "./controllers"
import './channels/workspace_notifications_channel.js'
import jquery from "jquery"
window.$ = jquery

const application = Application.start()
application.register('autocomplete', Autocomplete)

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }