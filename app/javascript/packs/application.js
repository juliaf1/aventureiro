require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

// External imports
import "bootstrap";
// import "../plugins/flatpickr"
// import flatpickr from 'flatpickr';
// import rangePlugin from "flatpickr/dist/plugins/rangePlugin";

// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';
import { initFlatpickr } from '../plugins/flatpickr.js';
import { toggleAllHidden } from '../plugins/journeys_display_all.js';
import { toggleHiddenInfo } from '../plugins/journey_index_toggle.js';
import { initUpdateNavbarOnScroll } from '../components/navbar.js';

document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  // initSelect2();
  toggleHiddenInfo();
  initUpdateNavbarOnScroll();
  initFlatpickr();
  toggleAllHidden();
});

require("trix")
require("@rails/actiontext")