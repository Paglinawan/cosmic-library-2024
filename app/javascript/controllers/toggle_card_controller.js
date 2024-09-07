import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["content"];

  connect() {
    this.showJapanese = true;
  }

  toggleCardType() {
    this.showJapanese = !this.showJapanese;
    this.render();
  }

  render() {
    const modelId = this.element.dataset.modelId;
    const modelType = this.element.dataset.modelType;
    const url = this.showJapanese
      ? `/${modelType}s/${modelId}/card_jp`
      : `/${modelType}s/${modelId}/card_en`;

    fetch(url)
      .then((response) => response.text())
      .then((html) => {
        this.contentTarget.innerHTML = html;
      });
  }
}
