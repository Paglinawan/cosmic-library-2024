export const toggleCard = () => {
  const cardSwitches = document.querySelectorAll(".js-card-switch");
  cardSwitches.forEach(function (cardSwitch) {
    cardSwitch.addEventListener("change", function () {
      let card = cardSwitch.closest(".card");
      if (card) {
        let isChecked = cardSwitch.checked;
        const id = cardSwitch.getAttribute("name");
        fetch("/api/v1/public_cards", {
          method: "POST",
          headers: {
            "Content-Type": "application/json",
            "X-CSRF-Token": document.querySelector('meta[name="csrf-token"]')
              .content,
          },
          body: JSON.stringify({ is_public: isChecked, id: Number(id) }),
        });
        card.classList.toggle("is-hidden");
      }
    });
  });
};
