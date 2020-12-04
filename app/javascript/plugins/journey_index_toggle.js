const toggleHiddenInfo = () => {

  const infoHiddenDivs = document.querySelectorAll(".info-hidden");
  const seeExtraInfoButtons = document.querySelectorAll('.see-extra-info');
  seeExtraInfoButtons.forEach((button) => {
    button.addEventListener('click', (event) => {
      event.preventDefault();
      infoHiddenDivs.item(button.dataset.id).classList.toggle("info-hidden");
    });
  });
};

export { toggleHiddenInfo };
