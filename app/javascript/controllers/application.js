import { Application } from "@hotwired/stimulus"

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }

+ import jquery from "jquery"
+ window.$ = jquery

import Raty from "raty.js"
window.raty = function (elem, opt) {
    let raty = new Raty(elem, opt)
    raty.init();
    return raty;
}