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
import flatpickr from 'flatpickr';
import rangePlugin from "flatpickr/dist/plugins/rangePlugin";

// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';

document.addEventListener('turbolinks:load', () => {
  flatpickr(".datepicker", {
    altInput: true,
    allowInput: true,
    enableTime: true,
    minDate: "today"
  });

  flatpickr("#range_start", {
    altInput: true,
    allowInput: true,
    minDate: "today",
    plugins: [new rangePlugin({ input: "#range_end"})]
  });
});
