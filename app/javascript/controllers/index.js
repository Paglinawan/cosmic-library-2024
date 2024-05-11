import { application } from "controllers/application";

import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading";
eagerLoadControllersFrom("controllers", application);

import { toggleCard } from "controllers/card";
toggleCard(".js-card-switch-film", "/api/v1/public_films");
toggleCard(".js-card-switch-book", "/api/v1/public_books");

import { animate } from "controllers/three";
animate();

import { chip } from "controllers/chip";
chip();
