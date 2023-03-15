import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

// Connects to data-controller="notifications-user-subscription"
export default class extends Controller {
  static values = { notificationsUserId: Number }
  static targets = ["notifications"]

  connect() {
    this.channel = createConsumer().subscriptions.create(
      { channel: "NotificationsUserChannel", id: this.notificationsUserIdValue },
      { received: data => this.notificationsTarget.insertAdjacentHTML("afterbegin", data) }
    )
    console.log(`Subscribe to the notifications_user with the id ${this.notificationsUserIdValue}.`)
  }

  disconnect() {
    console.log("Unsubscribed from the notifications_user")
    this.channel.unsubscribe()
  }
}
