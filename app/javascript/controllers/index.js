import { application } from "controllers/application";
import { animate } from "controllers/three";

animate();

import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading";
eagerLoadControllersFrom("controllers", application);
