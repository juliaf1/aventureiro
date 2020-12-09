const toggleAllHidden = () => {
  const hidden = document.querySelector(".hidden");

  const displayAll = document.getElementById('display-all');

  if (displayAll) {
    displayAll.addEventListener('click', (event) => {
      event.preventDefault();
      hidden.classList.toggle("hidden");
    });
  }
};

export { toggleAllHidden };
