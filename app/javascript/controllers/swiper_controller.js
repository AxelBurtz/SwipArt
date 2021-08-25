// Visit The Stimulus Handbook for more details
// https://stimulusjs.org/handbook/introduction
//
// This example controller works with specially annotated HTML like:
//
// <div data-controller="hello">
//   <h1 data-target="hello.output"></h1>
// </div>
import Swiper from 'swiper';
import 'swiper/swiper-bundle.css';
import { Controller } from "stimulus"
import { csrfToken } from "@rails/ujs";

export default class extends Controller {
  static targets = [ 'artwork_id' ]

  initialize() {

    this.swiper = new Swiper(this.element, {
      pagination: {
        el: ".swiper-pagination",
        dynamicBullets: true,
      },
    });

    this.swiper.on('slideNextTransitionEnd', this.next);
    this.swiper.on('slidePrevTransitionEnd', this.prev);
  }

  next(event) {
    // console.log(event.swipeDirection)
    // console.log(this.swiper)
    // send(event) {
    //   event.preventDefault();
    
    //   fetch('/artworks/:id/like', {
    //     method: 'POST',
    //     headers: { 'Accept': "application/json", 'X-CSRF-Token': csrfToken() },
    //     body: ????
    //   })
    //     .then(response => response.json())
    //     .then((data) => {
    //       console.log(data)
    //     });
    // }
  }

  prev(event) {
  //   console.log(event.swipeDirection)
  //   send(event) {
  //     event.preventDefault();
    
  //     fetch(this.formTarget.action, {
  //       method: 'POST',
  //       headers: { 'Accept': "application/json", 'X-CSRF-Token': csrfToken() },
  //       body: new FormData(this.prev)
  //     })
  //       .then(response => response.json())
  //       .then((data) => {
  //         // console.log(data)
  //       });
  //   }
  }
}
