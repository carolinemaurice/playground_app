import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="address-autocomplete"
export default class extends Controller {
  static values = { apiKey: String }

  static targets = ["address", "date", 'list', 'form']

  connect() {
    this.baseUrl = `https://api.geoapify.com/v1/geocode/autocomplete?format=json&apiKey=${this.apiKeyValue}`
  }

  update(event) {
    if (this.addressTarget.value.length >= 5) {
      const url = `${this.baseUrl}&text=${this.addressTarget.value}`
      fetch(url)
      .then(response => response.json())
      .then(data => this.#addAddressesToDiv(data.results))
    }
  }

  chooseAddress(event) {
    this.addressTarget.value = event.currentTarget.innerText
    this.listTarget.classList.add('d-none')
  }

  #addAddressesToDiv(results) {
    this.listTarget.innerHTML = ""
    if (results.length) {
      this.listTarget.classList.remove('d-none')
      results.forEach((result) => {
        const el = `<div data-action='click->address-autocomplete#chooseAddress'>${result.formatted}</div>`
        this.listTarget.insertAdjacentHTML('beforeend', el)
      })
    } else {
      this.listTarget.classList.add('d-none')
    }
  }
}
