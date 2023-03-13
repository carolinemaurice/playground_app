import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="display-playground"
export default class extends Controller {
  static targets = ["playground", "markers", "date"]

  connect() {
  }

  displayCard(event) {

    this.playgroundTarget.innerHTML = ""
    const url = `/playgrounds?playground_id=${event.params.id}&date=${this.dateTarget.value}`
    fetch(url, {headers: {"Accept": "text/plain"}})
    .then(response => response.text())
    .then((data) => {
      this.playgroundTarget.innerHTML = data
      // TODO: SCROLL TO ELEMENT
      scrollTo(0, 766)
    })


    // fetch playground controller and insert html to the playgroundtarget
  }
}
