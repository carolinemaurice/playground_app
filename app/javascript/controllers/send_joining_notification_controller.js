import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="send-joining-notification"
export default class extends Controller {
  static values = { sessionId: Number, playgroundId: Number }
  static targets = ["joinlink"]

  connect() {
  }

  send_notification(event) {
    const csrf = document.querySelector('meta[name="csrf-token"]').content
    console.log(csrf)
    const url = `/playgrounds/${this.playgroundIdValue}/sessions/${this.sessionIdValue}/notice_new_player?authenticity_token=${csrf}`
    fetch(url)
  }
}
