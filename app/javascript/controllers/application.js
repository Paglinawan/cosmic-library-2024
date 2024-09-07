import { Application } from "@hotwired/stimulus";
const application = Application.start();
application.debug = false;
window.Stimulus = application;
export { application };

import CardFilmController from "component/card_film_controller";
application.register("card-film", CardFilmController);

import CardBookController from "component/card_book_controller";
application.register("card-book", CardBookController);
