const initUpdateNavbarOnScroll = () => {
  const navbar = document.querySelector('.home-navbar');
  const localIcon = document.querySelector('.home-local-navbar-toggle');

  if (navbar) {
    window.addEventListener('scroll', () => {
      if (window.scrollY >= 100) {
        navbar.classList.add('home-navbar-blue');
        localIcon.classList.add('home-local-navbar-toggle-blue');
      } else {
        navbar.classList.remove('home-navbar-blue');
        localIcon.classList.remove('home-local-navbar-toggle-blue');
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
