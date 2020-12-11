import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  const banner = document.querySelector('#banner-typed');
  if (banner) {
    new Typed('#banner-typed', {
      strings: ["An island on the Green Coast", "a beach of caiçaras.", "Live an adventure.", "Connect with nature.", "Experience the caiçara way.", "Give it back to the community."],
      typeSpeed: 50,
      loop: true
    });
  }
}

export { loadDynamicBannerText };
