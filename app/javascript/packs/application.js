// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

const toggleFormVisibility = (form, target) => {
  form.style.display = "none";
  target.addEventListener("click", (e) => {
    if( form.style.display == "none" ){
      form.style.display = "block";
    } else {
      form.style.display = "none";
    }
  });
}

window.addEventListener("load", () => {
  toggleFormVisibility(document.getElementById("kernel_config_form"), document.getElementById("show_new_config_form"));
  toggleFormVisibility(document.getElementById("kernel_source_form"), document.getElementById("show_new_source_form"));
});
