import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="display-avatar-notice"
export default class extends Controller {
  static values = { unread: Number }
  static targets = ["notice"]

  connect() {
  }

  display_notice(event) {
    console.log("display_notice")
    this.noticeTarget.classList.remove("d-none")
  }

  undisplay_notice(event) {
    console.log("undisplay_notice")
    this.noticeTarget.classList.add("d-none")
  }
}
