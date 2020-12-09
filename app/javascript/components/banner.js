import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed', {
    strings: ["A big island on the Green Coast", "a beach of caiçaras", "with 1000 stars campsites."],
    typeSpeed: 20,
    loop: true
  });
}

export { loadDynamicBannerText };
