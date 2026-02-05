import { Application } from "@hotwired/stimulus"
import BookSearchController from "./controllers/book_search_controller"

const application = Application.start()
application.register("book-search", BookSearchController)

export { application }
