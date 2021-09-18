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

window.addEventListener("load", () => {
  const newConfigButton = document.getElementById("show_new_config_form");
  const newSourceButton = document.getElementById("show_new_source_form");
  const sourceForm = document.getElementById("kernel_source_form");
  const configForm = document.getElementById("kernel_config_form");

  sourceForm.style.display = "none";
  configForm.style.display = "none";

  newConfigButton.addEventListener("click", (e) => {
    if( configForm.style.display == "none"){
      configForm.style.display = "block";
    } else {
      configForm.style.display = "none";
    }
  });

  newSourceButton.addEventListener("click", (e) => {
    if( sourceForm.style.display == "none"){
      sourceForm.style.display = "block";
    } else {
      sourceForm.style.display = "none";
    }
  });
});