import { Controller } from "stimulus"


export default class extends Controller {
  static targets = [];
 
  connect() {
    
  }

  saved(event) {
    event.preventDefault();
    const element = event.currentTarget;
    const url = element.href;
    fetch(url, { 
     headers: { 'Accept': 'application/json' }
    })
    .then(response => response.json())
    .then((data) => {
      if (data.saved) {
        element.classList.add('active')
      } else {
        element.classList.remove('active')
      }
    })
  }
}