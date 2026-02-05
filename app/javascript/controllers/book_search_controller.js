import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ["searchInput", "bookItem", "submitButton"]
    static values = { selectedId: String }

    connect() {
        this.updateSubmitButton()
    }

    search() {
        const query = this.searchInputTarget.value.toLowerCase()

        this.bookItemTargets.forEach(item => {
            const title = item.dataset.bookTitle.toLowerCase()
            const author = item.dataset.bookAuthor.toLowerCase()

            if (title.includes(query) || author.includes(query)) {
                item.classList.remove("hidden")
            } else {
                item.classList.add("hidden")
            }
        })
    }

    selectBook(event) {
        const checkbox = event.currentTarget
        const bookId = checkbox.value

        // Uncheck all other checkboxes
        this.bookItemTargets.forEach(item => {
            const cb = item.querySelector('input[type="checkbox"]')
            if (cb && cb !== checkbox) {
                cb.checked = false
            }
        })

        // Update selected ID
        this.selectedIdValue = checkbox.checked ? bookId : ""
        this.updateSubmitButton()
    }

    updateSubmitButton() {
        if (this.hasSubmitButtonTarget) {
            this.submitButtonTarget.disabled = !this.selectedIdValue
        }
    }
}
