export const toggleModal = () => {
  const btns = document.querySelectorAll("[data-modal-target]");

  btns.forEach(function (btn) {
    btn.onclick = function () {
      const modal = document.querySelector(
        btn.getAttribute("data-modal-target")
      );
      modal.classList.add("is-display");
      document.body.classList.add("is-modal-open");
    };
  });
  var closes = document.querySelectorAll(".modal-close");

  closes.forEach(function (close) {
    close.onclick = function () {
      const modal = document.querySelector(
        close.getAttribute("data-modal-target")
      );
      modal.classList.remove("is-display");
      document.body.classList.remove("is-modal-open");
    };
  });

  window.onclick = function (event) {
    if (event.target.classList.contains("modal")) {
      event.target.classList.remove("is-display");
      document.body.classList.remove("is-modal-open");
    }
  };
};
