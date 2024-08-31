import { Controller } from "@hotwired/stimulus";
import { fetchGraphQL } from "graphql";

export default class extends Controller {
  static targets = ["content"];

  connect() {
    this.language = "ja";
  }

  async toggleCardType() {
    const modelId = this.element.dataset.id;
    const modelType = this.element.dataset.type;

    const query = `
      query($id: ID!) {
        ${modelType}(id: $id) {
          title
          titleEn
          comment
          commentEn
          director
          directorEn
          cast
          castEn
          reviewStar
          country {
            label
            labelEn
          }
          year
          isPublic
          isClassic
          isFavorite
          filmTags {
            label
            labelEn
          }
        }
      }
    `;

    // GraphQLリクエストを送信
    const response = await fetchGraphQL(query, { id: modelId });
    const data = await response.json();
    const film = data[modelType];

    // 表示切替
    this.language = this.language === "ja" ? "en" : "ja";
    this.updateContent(film);
  }

  updateContent(film) {
    this.contentTarget.innerHTML = `
      <div class="card-head">
        ${
          film.isClassic ||
          film.isFavorite ||
          (film.filmTags.length &&
            `
            <ul class="card-tags">
              ${
                film.isClassic &&
                `<li class="card-tag is-classic">${
                  this.language === "ja" ? "名作" : "Classic"
                }</li>`
              }
              ${
                film.isFavorite &&
                `<li class="card-tag is-favorite">${
                  this.language === "ja" ? "おすすめ" : "Favorite"
                }</li>`
              }
              ${film.filmTags.map(
                (tag) =>
                  `<li class="card-tag is-default">${
                    this.language === "ja" ? tag.label : tag.labelEn
                  }</li>`
              )}
            </ul>
          `)
        }
        <h3 class="card-title">${
          this.language === "ja" ? film.title : film.titleEn
        }</h3>
      </div>
      <div class="card-info">
        <p class="card-star">
          ${[...Array(5).keys()].map(
            (i) =>
              `<span class="${i < film.reviewStar ? "is-active" : ""}">★</span>`
          )}
        </p>
        <p class="card-when-where">${film.year} / ${
      this.language === "ja" ? film.country.label : film.country.labelEn
    }</p>
      </div>
      ${
        film.comment &&
        `<p class="card-body">${
          this.language === "ja" ? film.comment : film.commentEn
        }</p>`
      }
      ${
        film.director ||
        (film.cast &&
          `
          <details class="card-details">
            <summary class="toggle-more"><span class="toggle-more-close">閉じる</span><span class="toggle-more-open">開く</span></summary>
            <dl class="card-info-dl">
              ${
                film.director &&
                `<dt class="card-info-dt">監督</dt><dd class="card-info-dd">${
                  this.language === "ja" ? film.director : film.directorEn
                }</dd>`
              }
              ${
                film.cast &&
                `<dt class="card-info-dt">キャスト</dt><dd class="card-info-dd">${
                  this.language === "ja" ? film.cast : film.castEn
                }</dd>`
              }
            </dl>
          </details>
        `)
      }
    `;
  }
}
