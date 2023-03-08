import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="address-autocomplete"
export default class extends Controller {
  static values = { apiKey: String }

  static targets = ["address"]

  connect() {
    console.log(this.apiKeyValue)
    this.baseUrl = `https://api.geoapify.com/v1/geocode/autocomplete?format=json&apiKey=${this.apiKeyValue}`
  }

  update(event) {
    // if (this.addressTarget.value.length >= 5) {
    //   const url = `${this.baseUrl}&text=${this.addressTarget.value}`
    //   fetch(url).then(response => response.json()).then(data => console.log(data.results))
    // }
  }

  #clearInputValue() {
    this.addressTarget.value = ""
  }
}
