export const toggleCard = () => {
  const cardSwitches = document.querySelectorAll(".js-card-switch");
  cardSwitches.forEach(function (cardSwitch) {
    cardSwitch.addEventListener("change", function () {
      let card = cardSwitch.closest(".card");
      if (card) {
        card.classList.toggle("is-hidden");
      }
    });
  });
};
