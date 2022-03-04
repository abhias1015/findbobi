import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "suggestedTags" ]

  suggest(event) {
    console.log(`Hello!`)
    this.suggestedTagsTarget.innerHTML = '<div>Suggested Tags</div>'
  }
}
