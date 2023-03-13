import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="display-playground-sessions-reviews"
export default class extends Controller {
  static targets = ["sessionslink", "reviewslink", "sessionslist", "reviewslist"]

  connect() {
  }

  displaySessions(event) {
    event.preventDefault()
    this.sessionslinkTarget.classList.toggle("mute")
    this.reviewslinkTarget.classList.toggle("mute")
    this.sessionslistTarget.classList.toggle("d-none")
    this.reviewslistTarget.classList.toggle("d-none")
  }

  displayReviews(event) {
    event.preventDefault()
    this.sessionslinkTarget.classList.toggle("mute")
    this.reviewslinkTarget.classList.toggle("mute")
    this.sessionslistTarget.classList.toggle("d-none")
    this.reviewslistTarget.classList.toggle("d-none")
  }
}
