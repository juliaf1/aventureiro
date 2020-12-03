const initUpdateNavbarOnScroll = () => {
  const navbar = document.querySelector('.home-navbar');
  if (navbar) {
    window.addEventListener('scroll', () => {
      if (window.scrollY >= 100) {
        navbar.classList.add('home-navbar-blue');
      } else {
        navbar.classList.remove('home-navbar-blue');
      }
    });
  }
}

export { initUpdateNavbarOnScroll };
