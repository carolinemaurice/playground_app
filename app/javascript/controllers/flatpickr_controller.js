import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr"
import rangePlugin from "flatpickr/dist/plugins/rangePlugin";


export default class extends Controller {
  // retrieve the targets from the DOM
  static targets = [ 'startDateInput', 'address']

  // On controller's connection, call the flatpickr
  // function in order to build the calendars
  connect() {
    this.date = 'today'
    if (this.startDateInputTarget.value) {
      this.date = this.startDateInputTarget.value
    }
    flatpickr(this.startDateInputTarget, {
      minDate: 'today',
      defaultDate: this.date,
      dateFormat: "d M",
      disableMobile: true
    })
  }
}
