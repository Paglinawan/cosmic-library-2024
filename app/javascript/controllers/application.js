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
    const chipsIcon = document.querySelector(".form-chips-select-icon");

    const setPlaceholder = () => {
      if (chipsField.children.length === 0) {
        chipsField.innerHTML =
          '<p class="placeholder text-gray">カテゴリを選択してください</p>';
      } else {
        const placeholder = chipsField.querySelector(".placeholder");
        if (placeholder) placeholder.remove();
      }
    };
    setPlaceholder();

    const insertChip = (input, value) => {
      const text = input.nextElementSibling.textContent;
      const chipEl = document.createElement("div");
      const getClassName = `form-chip-${value}`;

      chipEl.classList.add("form-chip", getClassName);
      chipEl.textContent = text;

      chipsField.appendChild(chipEl);
      input.checked = true;
      input.closest("label").classList.add("is-active");
      setPlaceholder();
    };

    const removeChip = (input, value) => {
      const getClassName = `form-chip-${value}`;
      const targetChip = document.querySelector(`.${getClassName}`);

      if (targetChip) targetChip.remove();
      input.checked = false;
      input.closest("label").classList.remove("is-active");
      setPlaceholder();
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
    const selfRemoveChip = (target) => {
      if (!target.classList.contains("form-chip")) return;

      const chipValue = target.classList[1].split("-")[2];
      const input = document.querySelector(`input[value="${chipValue}"]`);
      if (input) {
        removeChip(input, chipValue);
        target.remove();
      }
    };

    chipsField.addEventListener("click", (e) => {
      selfRemoveChip(e.target);
    });

    // - toggleDisplayOptions
    const toggleDisplayOptions = (target) => {
      if (!target.classList.contains("form-chip")) {
        const chipsOption = document.querySelector(".form-chips-options");
        chipsOption.classList.toggle("show");
        chipsField.classList.toggle("is-active");
      }
    };
    chipsField.addEventListener("click", (e) => toggleDisplayOptions(e.target));
    chipsIcon.addEventListener("click", (e) => toggleDisplayOptions(e.target));
  });
};
