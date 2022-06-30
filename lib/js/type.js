// import Typed from 'typed.js';

// var typed = new Typed('.site-title', {
//   strings: [window.CONFIG.site.title],
//   typeSpeed: 70
// });
import { gsap } from "gsap";

const animatedText = document.getElementById("animate");
const animatedTextStroke = document.getElementById("animate-stroke");
const guideText = document.getElementById("guide");

// select the spans in in the guide
const guideSpans = guideText.getElementsByTagName("span");

// select the spans in in the guide
const animatedSpans = animatedText.getElementsByTagName("span");
const animatedSpansStroke = animatedTextStroke.getElementsByTagName("span");

const textLength = guideSpans.length;

const placeSpans = () => {
  // for each span in the guide
  for (var i = 0; i < textLength; i++) {
    let guide = guideSpans[i];
    let animated = animatedSpans[i];
    let animatedStroke = animatedSpansStroke[i];
    // get the guide client rect
    let rect = guide.getBoundingClientRect();
    // set the left property of the animate
    // span to rect.left
    animated.style.left = rect.left + "px";
    animatedStroke.style.left = rect.left + "px";
  }
};

const animateLetterIn = (i) => {
  setTimeout(() => {
    gsap.fromTo(
      animatedSpans[i],
      { opacity: 0, y: 40 },
      {
        duration: 0.4,
        opacity: 1,
        y: 0,
        ease: "power3",
      }
    );
    gsap.fromTo(
      animatedSpans[i],
      { scale: 0 },
      {
        duration: 0.4,
        scale: 1,
        ease: "back",
      }
    );
    gsap.fromTo(
      animatedSpansStroke[i],
      { opacity: 0, y: 40 },
      {
        duration: 0.4,
        opacity: 1,
        y: 0,
        ease: "power3",
      }
    );
    gsap.fromTo(
      animatedSpansStroke[i],
      { scale: 0 },
      {
        duration: 0.4,
        scale: 1,
        ease: "back",
      }
    );
  }, i * 200);
};

const animateIn = () => {
  for (var i = 0; i < textLength; i++) {
    animateLetterIn(i);
  }
};

// just to make sure the text will fit the window width
const resizeText = (text, fontSize) => {
  text.style.fontSize = fontSize + "px";
  text.style.height = fontSize + "px";
  text.style.lineHeight = fontSize + "px";
};

const resize = () => {
  let fontSize = window.innerWidth / 8;
  if (fontSize > 100) fontSize = 100;
  fontSize * -0.5 + "px";
  resizeText(animatedText, fontSize);
  resizeText(guideText, fontSize);
  resizeText(animatedTextStroke, fontSize);
  placeSpans();
};

if (document.fonts && document.fonts.ready) {
  document.fonts.ready.then(() => {
    resize();
    animateIn();
    window.addEventListener("resize", resize);
  });
} else {
  setTimeout(() => {
    resize();
    animateIn();
    window.addEventListener("resize", resize);
  }, 500);
}
