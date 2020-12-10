const initNavbarToggle = () => {
  const localIcon = document.querySelector('.local-navbar-toggle');
  const localIconHome = document.querySelector('.home-local-navbar-toggle');
  const localNavbar = document.querySelector('.local-navbar');
  const localNavbarHome = document.querySelector('.home-local-navbar');
  let current_rotation = 0;

  if (localIcon) {
    localIcon.addEventListener('click', (event) => {
      current_rotation += 360;
      localIcon.style.transform = 'rotate(' + current_rotation + 'deg)';
      localNavbar.classList.toggle('navbar-hidden');
    });
  } else if (localIconHome) {
    localIconHome.addEventListener('click', (event) => {
      current_rotation += 360;
      localIconHome.style.transform = 'rotate(' + current_rotation + 'deg)';
      localNavbarHome.classList.toggle('navbar-hidden');
    });
  }
}

export { initNavbarToggle }
