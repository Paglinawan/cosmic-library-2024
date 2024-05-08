export const toggleCard = (target, endpoint) => {
  const cardSwitches = document.querySelectorAll(target);
  cardSwitches.forEach(function (cardSwitch) {
    cardSwitch.addEventListener("change", function () {
      let card = cardSwitch.closest(".card");
      if (card) {
        let isChecked = cardSwitch.checked;
        const id = cardSwitch.getAttribute("name");
        fetch(endpoint, {
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
