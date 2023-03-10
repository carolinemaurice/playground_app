import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="display-playground-session"
export default class extends Controller {
  static targets = ["playground", "markers"]

  connect() {
  }

  displayCard(event) {
    this.playgroundTarget.innerHTML = ""
    const url = `/playgrounds?playground_id=${event.params.id}`
    fetch(url, {headers: {"Accept": "text/plain"}})
    .then(response => response.text())
    .then((data) => {
      this.playgroundTarget.innerHTML = data
      // TODO: SCROLL TO ELEMENT
    })


    // fetch playground controller and insert html to the playgroundtarget
  }
}
