import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr"
import rangePlugin from "flatpickr/dist/plugins/rangePlugin";


export default class extends Controller {
  // retrieve the targets from the DOM
  static targets = [ 'startDateInput']

  // On controller's connection, call the flatpickr
  // function in order to build the calendars
  connect() {
    console.log('oups I did it again')
    flatpickr(this.startDateInputTarget, {
      minDate: 'today',
      defaultDate: 'today',
      dateFormat: "d M",
    })

  }
}
