import { application, toggleCard, chip } from "controllers/application";
import { animate } from "controllers/three";

toggleCard(".js-card-switch-film", "/api/v1/public_films");
toggleCard(".js-card-switch-book", "/api/v1/public_books");
chip();
animate();

import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading";
eagerLoadControllersFrom("controllers", application);
