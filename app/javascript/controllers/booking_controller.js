import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["dateStart", "dateEnd", "totalPrice"]
  static values = { pricePerDay: Number }

  connect() {
    this.calculate()
  }

  calculate() {
    const start = new Date(this.dateStartTarget.value)
    const end = new Date(this.dateEndTarget.value)

    if (isNaN(start) || isNaN(end)) {
      this.totalPriceTarget.textContent = "0€"
      return
    }

    const days = Math.ceil((end - start) / (1000 * 60 * 60 * 24)) + 1
    const total = days > 0 ? days * this.pricePerDayValue : 0

    this.totalPriceTarget.textContent = `${total.toFixed(2)}€`
  }

  // Watch input changes
  dateStartTargetConnected() {
    this.dateStartTarget.addEventListener("change", () => this.calculate())
  }

  dateEndTargetConnected() {
    this.dateEndTarget.addEventListener("change", () => this.calculate())
  }
}
