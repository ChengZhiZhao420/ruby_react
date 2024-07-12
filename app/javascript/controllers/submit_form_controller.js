import {Controller} from "@hotwired/stimulus"

export default class extends Controller{
    submit(event) {
        console.log(event)
        this.element.requestSubmit()
    }
}