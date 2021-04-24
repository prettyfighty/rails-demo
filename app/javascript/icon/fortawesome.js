import { library, dom } from '@fortawesome/fontawesome-svg-core'
import { faUserAstronaut, faHeartBroken } from '@fortawesome/free-solid-svg-icons'
import { faBell } from '@fortawesome/free-regular-svg-icons'

// We are only using the user-astronaut icon
library.add(faUserAstronaut, faHeartBroken, faBell )

// Replace any existing <i> tags with <svg> and set up a MutationObserver to
// continue doing this as the DOM changes.
dom.watch()