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

// let counter = 0


export default class extends Controller {
  static targets = [ 'slide' ]
 
  connect() {
    this.swiper = new Swiper(this.element, {
      loop: true,
      pagination: {
        el: ".swiper-pagination",
        dynamicBullets: true,
      },
    });

    window.swiper = this.swiper;

    console.log(this.swiper.activeIndex)
    console.log(this.slideTargets);

    this.swiper.on('slideNextTransitionEnd', this.next.bind(this));
    this.swiper.on('slidePrevTransitionEnd', this.prev.bind(this));
  }

  next(event) {
    console.log("next -> dislike")
    // console.log(this.swiper.activeIndex)
    // console.log(this.swiper.slides);

    this.swiper.removeSlide(this.swiper.activeIndex - 2) 
  }
  
  prev(event) {
    console.log("prev -> like")
    // counter += 1
    // console.log(counter)
    // console.log(this.swiper.activeIndex)
    // console.log(this.swiper.slides);

    // CAREFUL: order is important here!
    const slideToLike = this.swiper.slides[this.swiper.activeIndex + 1];
    const likeUrl = slideToLike.dataset.likeUrl
    console.log(slideToLike)

    // As soon as we remove a slide, the activeIndex CHANGES
    this.swiper.removeSlide(this.swiper.activeIndex)

    if (this.swiper.activeIndex == 1) {
      this.swiper.slideTo(this.swiper.activeIndex - 1, 0, false)
    } 

    fetch(likeUrl, {
      method: 'POST',
      headers: { 'Accept': "application/json", 'X-CSRF-Token': csrfToken() }
    })
      .then(response => response.json())
      .then((data) => {
        console.log(data)

        // si data redirect est à true, alors changer la window location avec la valeur stockee dans data url
        if (data.redirect === true) {
          window.location.href = data.url 
        }
    });

    // if (counter == 5) {
    //   window.location.href = "/dashboard"
    // }
  //   if () {
  // }  
  }
}
