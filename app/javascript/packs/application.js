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

  const addNewConfigFileButton = document.getElementById("add_new_config_file");
  addNewConfigFileButton.addEventListener("click", (e) => {
    handleCreateNewConfig();
  });

  const addNewSourceButton = document.getElementById("add_new_kernel_source");
  addNewSourceButton.addEventListener("click", (e) => {
    handleCreateNewSource();
  });
});

const handleCreateNewConfig = () => {
  const newConfigFileFieldValue = document.getElementById("new_config_file").value;

  if( newConfigFileFieldValue == "" ){
    console.log("No file uploaded. Please upload a file to continue.")
  } else {
    console.log("New Config File: " + newConfigFileFieldValue);
    window.location.reload();
  }
}

const handleCreateNewSource = () => {
  const NewGitRepoFieldValue = document.getElementById("new_git_repo").value;
  const NewGitRefFieldValue = document.getElementById("new_git_ref").value;

  if( NewGitRepoFieldValue == "" || NewGitRefFieldValue == "" ){
    console.log("Please enter both a git repo and git ref to continue.")
  } else {
    console.log("New Kernel Source Info: ");
    console.log("Git Repo: " + NewGitRepoFieldValue);
    console.log("Git Ref: " + NewGitRefFieldValue);
    window.location.reload();
  }
}