import { Application } from "@hotwired/stimulus"
import flatpickr from "flatpickr"

// Initialize Stimulus
const application = Application.start()
application.debug = false
window.Stimulus = application

// Apply Flatpickr after each page load (works with Turbo)
document.addEventListener("turbo:load", () => {
  flatpickr(".datepicker", {
    enableTime: false,
    dateFormat: "Y-m-d"
  });
});

export { application }
