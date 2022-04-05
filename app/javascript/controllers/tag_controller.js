import { Controller } from "@hotwired/stimulus"
import { FetchResponse } from '@rails/request.js'

export default class extends Controller {
  static targets = [ "suggestedTags" ]

  suggest(event) {
    console.log(`Hello!`)
    const request = new FetchResponse('/businesses/suggested_tags', { responseKind: "turbo-stream" })
    return await request.perform
  }
}
