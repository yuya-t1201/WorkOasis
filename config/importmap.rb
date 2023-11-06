# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: 'stimulus.min.js', preload: true
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
pin_all_from "app/javascript/controllers", under: "controllers"
pin "jquery", to: "https://ga.jspm.io/npm:jquery@3.7.0/dist/jquery.js"
pin "@fortawesome/fontawesome-free", to: "https://ga.jspm.io/npm:@fortawesome/fontawesome-free@6.4.2/js/all.js"
pin_all_from "app/javascript/channels", under: "channels"
pin "stimulus-autocomplete", to: "https://ga.jspm.io/npm:stimulus-autocomplete@3.1.0/src/autocomplete.js"
pin "@github/auto-complete-element", to: "https://ga.jspm.io/npm:@github/auto-complete-element@3.5.1/dist/index.js"
pin "@github/combobox-nav", to: "https://ga.jspm.io/npm:@github/combobox-nav@2.3.0/dist/index.js"
pin "@rails/actioncable", to: "https://ga.jspm.io/npm:@rails/actioncable@7.1.1/app/assets/javascripts/actioncable.esm.js"
