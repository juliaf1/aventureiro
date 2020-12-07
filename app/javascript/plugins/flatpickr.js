import flatpickr from "flatpickr";
import rangePlugin from "flatpickr/dist/plugins/rangePlugin";


const initFlatpickr = () => {
  flatpickr(".datepicker", {
    altInput: true
  });

  flatpickr(".birthdaypicker", {
    altInput: true,
    allowInput: true,
    minDate: "01.01.1930",
    maxDate: "31.12.2002",
    dateFormat: "d.m.Y",
    defaultDate: "20-10-1990"
  });

  flatpickr(".journeypicker", {
    altInput: true,
    allowInput: true,
    enableTime: true,
    minTime: "07:00",
    maxTime: "20:00",
    minDate: "today"
  });

  flatpickr("#check_in", {
    altInput: true,
    allowInput: true,
    minDate: "today",
    plugins: [new rangePlugin({ input: "#check_out"})]
  });

  flatpickr("#start_date", {
    altInput: true,
    allowInput: true,
    minDate: "today",
    plugins: [new rangePlugin({ input: "#end_date"})]
  });
};

export { initFlatpickr };
