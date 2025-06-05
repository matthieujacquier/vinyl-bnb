import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr"

export default class extends Controller {
  static targets = ["input"]

  connect() {
    this.inputTargets.forEach(input => {
      flatpickr(input, {
        altInput: true,
        altFormat: "F j, Y",
        dateFormat: "Y-m-d",
        minDate: "today",
      })
    })
  }
}
