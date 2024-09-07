import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["contentJp", "contentEn"];

  toggleLang() {
    this.contentJpTarget.classList.toggle("hidden");
    this.contentEnTarget.classList.toggle("hidden");
  }
}
