import { Controller } from "@hotwired/stimulus";
import { fetchGraphQL } from "graphql";

export default class extends Controller {
  static targets = ["content"];

  connect() {
    this.language = "en";
    this.toggleCardType();
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

    const response = await fetchGraphQL(query, { id: modelId });
    const data = await response.json();
    const film = data.data.film;

    this.language = this.language === "jp" ? "en" : "jp";
    const content = this.getContent(film, this.language);
    this.renderCard(content);
  }

  getContent(film, lang) {
    const isJp = lang === "jp";
    if (isJp)
      return {
        title: film.title,
        country: film.country.label,
        comment: film.comment,
        director: film.director,
        cast: film.cast,
        reviewStar: film.reviewStar,
        year: film.year,
        filmTags: film.filmTags.map((tag) => tag.label),
        label: {
          classic: "名作",
          favorite: "おすすめ",
          close: "閉じる",
          open: "開く",
          director: "監督",
          cast: "キャスト",
        },
      };

    return {
      title: film.titleEn,
      country: film.country.labelEn,
      comment: film.commentEn,
      director: film.directorEn,
      cast: film.castEn,
      reviewStar: film.reviewStar,
      year: film.year,
      filmTags: film.filmTags.map((tag) => tag.labelEn),
      label: {
        classic: "Classic",
        favorite: "Recommend",
        close: "Close",
        open: "Open",
        director: "Director",
        cast: "Cast",
      },
    };
  }

  renderCard(content) {
    const isDisplayCardHead =
      content.isClassic || content.isFavorite || content.filmTags.length;
    const isDisplayCardDetails = content.director || content.cast;

    this.contentTarget.innerHTML = `
      <div class="card-head">
        ${
          isDisplayCardHead
            ? `
            <ul class="card-tags">
              <li class="card-tag is-classic">${content.label.classic}</li>
              <li class="card-tag is-favorite">${content.label.favorite}</li>
              ${content.filmTags
                .map((tag) => `<li class="card-tag is-default">${tag}</li>`)
                .join("")}
            </ul>
          `
            : ""
        }
        <h3 class="card-title">${content.title}</h3>
      </div>
      <div class="card-info">
        <p class="card-star">
          ${[...Array(5).keys()]
            .map(
              (i) =>
                `<span class="${
                  i < content.reviewStar && "is-active"
                }">★</span>`
            )
            .join("")}
        </p>
        <p class="card-when-where">${content.year} / ${content.country}</p>
      </div>
      ${content.comment && `<p class="card-body">${content.comment}</p>`}
      ${
        isDisplayCardDetails &&
        `
          <details class="card-details">
            <summary class="toggle-more"><span class="toggle-more-close">${
              content.label.close
            }</span><span class="toggle-more-open">${
          content.label.open
        }</span></summary>
            <dl class="card-info-dl">
              ${
                content.director &&
                `<dt class="card-info-dt">${content.label.director}</dt><dd class="card-info-dd">${content.director}</dd>`
              }
              ${
                content.cast &&
                `<dt class="card-info-dt">${content.label.cast}</dt><dd class="card-info-dd">${content.cast}</dd>`
              }
            </dl>
          </details>
        `
      }
    `;
  }
}
