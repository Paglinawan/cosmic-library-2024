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
          author
          authorEn
          quote
          quoteEn
          reviewStar
          country {
            label
            labelEn
          }
          publisher {
            label
            labelEn
          }
          year
          isPublic
          isClassic
          isFavorite
          bookTags {
            label
            labelEn
          }
        }
      }
    `;

    const response = await fetchGraphQL(query, { id: modelId });
    const data = await response.json();
    const book = data.data.book;

    this.language = this.language === "jp" ? "en" : "jp";
    const content = this.getContent(book, this.language);
    this.renderCard(content);
  }

  getContent(book, lang) {
    const isJp = lang === "jp";
    if (isJp)
      return {
        title: book.title,
        country: book.country.label,
        publisher: book.publisher.label,
        comment: book.comment,
        author: book.author,
        quote: book.quote,
        reviewStar: book.reviewStar,
        year: book.year,
        bookTags: book.bookTags.map((tag) => tag.label),
        label: {
          classic: "名作",
          favorite: "おすすめ",
          close: "閉じる",
          open: "開く",
          author: "著者",
          publisher: "出版社",
          quote: "引用",
        },
      };

    return {
      title: book.titleEn,
      country: book.country.labelEn,
      publisher: book.publisher.labelEn,
      comment: book.commentEn,
      author: book.authorEn,
      quote: book.quoteEn,
      reviewStar: book.reviewStar,
      year: book.year,
      bookTags: book.bookTags.map((tag) => tag.labelEn),
      label: {
        classic: "Classic",
        favorite: "Recommend",
        close: "Close",
        open: "Open",
        author: "Author",
        publisher: "Publisher",
        quote: "Quote",
      },
    };
  }

  renderCard(content) {
    const isDisplayCardHead =
      content.isClassic || content.isFavorite || content.bookTags.length;
    const isDisplayCardDetails =
      content.author || content.publisher || content.quote;

    this.contentTarget.innerHTML = `
      <div class="card-head">
        ${
          isDisplayCardHead
            ? `
            <ul class="card-tags">
              <li class="card-tag is-classic">${content.label.classic}</li>
              <li class="card-tag is-favorite">${content.label.favorite}</li>
              ${content.bookTags
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
                content.author &&
                `<dt class="card-info-dt">${content.label.author}</dt><dd class="card-info-dd">${content.author}</dd>`
              }
              ${
                content.publisher &&
                `<dt class="card-info-dt">${content.label.publisher}</dt><dd class="card-info-dd">${content.publisher}</dd>`
              }
              ${
                content.quote &&
                `<dt class="card-info-dt">${content.label.quote}</dt><dd class="card-info-dd">${content.quote}</dd>`
              }
            </dl>
          </details>
        `
      }
    `;
  }
}
