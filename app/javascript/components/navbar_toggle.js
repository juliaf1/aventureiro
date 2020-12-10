const initNavbarToggle = () => {
  const localIcon = document.querySelector('.local-navbar-toggle');
  const localNavbar = document.querySelector('.local-navbar');
  const localNavbarHome = document.querySelector('.home-local-navbar');
  let current_rotation = 0;

  if (localIcon) {
    localIcon.addEventListener('click', (event) => {
      current_rotation += 360;
      localIcon.style.transform = 'rotate(' + current_rotation + 'deg)';
      localNavbar.classList.toggle('navbar-hidden');
      localNavbarHome.classList.toggle('home-navbar-hidden');
    });
  };
}

export { initNavbarToggle }
