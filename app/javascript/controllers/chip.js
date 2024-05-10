export const chip = () => {
  const initializeChips = () => {
    const formChipsOptions = document.querySelectorAll(
      ".form-chips-option-label"
    );

    formChipsOptions.forEach((checkbox) => {
      const label = checkbox.closest("label");
      if (checkbox.checked) {
        label.classList.add("is-active");
        const text = checkbox.nextElementSibling.textContent;

        const chipElement = document.createElement("div");
        chipElement.classList.add("form-chip", `form-chip-${checkbox.value}`);
        chipElement.textContent = text;

        document.querySelector(".form-chips-input").appendChild(chipElement);
      }
    });
  };

  const setupListeners = () => {
    document
      .querySelectorAll(".form-chips-option-label")
      .forEach((checkbox) => {
        checkbox.addEventListener("change", (e) => {
          const label = e.target.closest("label");
          if (e.target.checked) {
            label.classList.add("is-active");
            const text = e.target.nextElementSibling.textContent;

            const chipElement = document.createElement("div");
            chipElement.classList.add(
              "form-chip",
              `form-chip-${e.target.value}`
            );
            chipElement.textContent = text;

            document
              .querySelector(".form-chips-input")
              .appendChild(chipElement);
          } else {
            label.classList.remove("is-active");
            const chipClassName = `form-chip-${e.target.value}`;
            const chipToRemove = document.querySelector(`.${chipClassName}`);
            if (chipToRemove) {
              chipToRemove.remove();
            }
          }
        });
      });

    document
      .querySelector(".form-chips-input")
      .addEventListener("click", () => {
        const formChipsOption = document.querySelector(".form-chips-options");
        formChipsOption.classList.toggle("show");
      });
  };

  document.addEventListener("DOMContentLoaded", () => {
    initializeChips();
    setupListeners();
  });
};
