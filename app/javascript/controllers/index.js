import { application } from "controllers/application";

import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading";
eagerLoadControllersFrom("controllers", application);

import { toggleCard } from "controllers/card";
toggleCard();

import { animate } from "controllers/three";
animate();

import { toggleModal } from "controllers/modal";
toggleModal();
