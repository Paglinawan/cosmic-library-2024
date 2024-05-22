import { Application } from "@hotwired/stimulus";

const application = Application.start();

// Configure Stimulus development experience
application.debug = false;
window.Stimulus = application;

export { application };

/* ------------
- toggleCard
------------ */
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

/* ------------
- chip
------------ */
export const chip = () => {
  document.addEventListener("DOMContentLoaded", () => {
    // - handleChip
    const optionLabels = document.querySelectorAll(".form-chips-label");
    const chipsField = document.querySelector(".form-chips-input");
    const insertChip = (input, value) => {
      const text = input.nextElementSibling.textContent;
      const chipEl = document.createElement("div");

      const getClassName = `form-chip-${value}`;
      chipEl.classList.add(`form-chip`, getClassName);
      const label = input.closest("label");

      chipEl.textContent = text;
      chipsField.appendChild(chipEl);
      label.classList.add("is-active");
    };
    const removeChip = (input, value) => {
      const getClassName = `form-chip-${value}`;
      const targetChip = document.querySelector(`.${getClassName}`);
      const label = input.closest("label");

      if (targetChip) targetChip.remove();
      label.classList.remove("is-active");
    };
    const handleChip = (input) => {
      if (input.checked) {
        insertChip(input, input.value);
      } else {
        removeChip(input, input.value);
      }
    };
    optionLabels.forEach((label) => {
      const input = label.querySelector("input");
      handleChip(input);
      label.addEventListener("click", (e) => handleChip(e.target));
    });

    // - selfRemoveChip
    const chips = document.querySelectorAll(".form-chip");
    const selfRemoveChip = (target) => {
      const chipValue = target.classList[1].split("-")[2];
      const input = document.querySelector(`input[value="${chipValue}"]`);
      input.checked = !input.checked;
      const label = input.closest(".form-chips-label");
      label.classList.toggle("is-active", input.checked);
      target.remove();
    };
    chips.forEach((chip) => {
      chip.addEventListener("click", (e) => {
        selfRemoveChip(e.target);
      });
    });

    // - toggleDisplayOptions
    const toggleDisplayOptions = (target) => {
      if (!target.classList.contains("form-chip")) {
        const chipsOption = document.querySelector(".form-chips-options");
        chipsOption.classList.toggle("show");
      }
    };
    if (chipsField)
      chipsField.addEventListener("click", (e) =>
        toggleDisplayOptions(e.target)
      );
  });
};
