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

const toggleFormVisibility = (dropdownParam, formParam, dropdownButtonParam, formButtonParam) => {
  const dropdown = dropdownParam;
  const form = formParam;
  const dropdownButton = dropdownButtonParam;
  const formButton = formButtonParam;
  
  dropdown.style.display = "block";
  form.style.display = "none";
  formButton.style.display = "block";
  dropdownButton.style.display = "none";

  dropdownButton.addEventListener("click", (e) => {
    formButton.style.display = "block";
    dropdown.style.display = "block";
    form.style.display = "none";
    dropdownButton.style.display = "none";
  });

  formButton.addEventListener("click", (e) => {
    dropdownButton.style.display = "block";
    form.style.display = "block";
    dropdown.style.display = "none";
    formButton.style.display = "none";
  });
}

window.addEventListener("load", () => {
  toggleFormVisibility(
    document.getElementById("config_dropdown_form"),
    document.getElementById("kernel_config_form"),
    document.getElementById("show_config_dropdown"),
    document.getElementById("show_new_config_form")
  );
  toggleFormVisibility(
    document.getElementById("source_dropdown_form"),
    document.getElementById("kernel_source_form"),
    document.getElementById("show_source_dropdown"),
    document.getElementById("show_new_source_form")
  );
});
