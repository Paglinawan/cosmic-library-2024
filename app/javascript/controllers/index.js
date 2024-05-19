import {
  application,
  toggleCard,
  chip,
  animate,
} from "controllers/application";

toggleCard(".js-card-switch-film", "/api/v1/public_films");
toggleCard(".js-card-switch-book", "/api/v1/public_books");
chip();
animate();

import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading";
eagerLoadControllersFrom("controllers", application);
