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
  const localNavbar = document.querySelector('.home-local-navbar');
  if (localNavbar) {
    window.addEventListener('scroll', () => {
      if (window.scrollY >= 100) {
        localNavbar.classList.add('local-navbar-green');
      } else {
        localNavbar.classList.remove('local-navbar-green');
      }
    });
  }
}



export { initUpdateNavbarOnScroll };
