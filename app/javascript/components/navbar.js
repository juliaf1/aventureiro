const initUpdateNavbarOnScroll = () => {
  const navbar = document.querySelector('.navbar-lewagon');
  if (navbar) {
    window.addEventListener('scroll', () => {
      if (window.scrollY >= 400) {
        navbar.classList.add('navbar-lewagon-blue');
      } else {
        navbar.classList.remove('navbar-lewagon-blue');
      }
    });
  }
}

export { initUpdateNavbarOnScroll };
