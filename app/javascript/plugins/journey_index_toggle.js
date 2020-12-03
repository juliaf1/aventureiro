const toggleHidden = () => {
  const hidden = document.querySelector(".hidden");

  const displayAll = document.getElementById('display-all')

  displayAll.addEventListener('click', (event) => {
    event.preventDefault();
    hidden.classList.toggle("hidden");
  });

  const infoHidden = document.querySelector(".info-hidden");

  const seeExtraInfo = document.getElementById('see-extra-info')

  seeExtraInfo.addEventListener('click', (event) => {
    event.preventDefault();
    infoHidden.classList.toggle("info-hidden");
  });

};

export { toggleHidden };
