import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="display-playground-sessions-reviews"
export default class extends Controller {
  static targets = ["sessions-list", "reviews-list"]

  connect() {
    console.log("")
  }


}
