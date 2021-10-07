// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
require('jquery')
require("@nathanvda/cocoon")


Rails.start()
Turbolinks.start()
ActiveStorage.start()

// $(function(){
//     history.pushState(null, null, null); //ブラウザバック無効化
//         //ブラウザバックボタン押下時
//     $(window).on("popstate", function (event) {
//         history.pushState(null, null, null);
//         window.alert('戻るボタンは使えません');
//     });
// });