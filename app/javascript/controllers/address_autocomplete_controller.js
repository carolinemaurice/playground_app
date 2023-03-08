import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="address-autocomplete"
export default class extends Controller {
  static values = { apiKey: String }

  static targets = ["address", "autocomplete"]

  connect() {
    console.log(this.apiKeyValue)
    this.baseUrl = `https://api.geoapify.com/v1/geocode/autocomplete?format=json&apiKey=${this.apiKeyValue}`
  }

  update(event) {
    // if (this.addressTarget.value.length >= 5) {
    //   const url = `${this.baseUrl}&text=${this.addressTarget.value}`
    //   fetch(url).then(response => response.json()).then(data => this.#addAddressesToDiv(data.results))
    // }
  }

  #addAddressesToDiv(results) {

    // this.autocompleteTarget.innerHTML = ""
    // if (results.length) {
    //   this.autocompleteTarget.classList.remove('d-none')
    //   results.forEach((result) => {
    //     const el = `<div><p>${result.formatted}</p></div>`

    //     this.autocompleteTarget.insertAdjacentHTML('beforeend', el)
    //   })
    // } else {
    //   this.autocompleteTarget.classList.add('d-none')
    // }
  }
}
