import {Controller} from "@hotwired/stimulus"

export default class extends Controller{
    click(event){
        console.log("clicking")
        var driver = event.target.value
        var input = document.getElementById("custom_field");

        if(driver == input.value){
            input.value = ''
        }else{
            input.value = driver
        }

        const inputEvent = new Event('input', { bubbles: true });
        input.dispatchEvent(inputEvent);
    }
}