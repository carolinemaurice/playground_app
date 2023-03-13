import { Controller } from "@hotwired/stimulus"
// import { ScrollTo } from "@stimulus-scroll-to"

// const application = Application.start()
// application.register('scroll-to', ScrollTo)
// Connects to data-controller="display-playground-session"
export default class extends Controller {
  static targets = ["playground", "markers"]

  connect() {
  }

  displayCard(event) {
    console.log('im here')
    this.playgroundTarget.innerHTML = ""
    const url = `/playgrounds?playground_id=${event.params.id}`
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
