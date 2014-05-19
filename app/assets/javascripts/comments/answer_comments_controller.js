function AnswerCommentsController(view) {
  this.view = view;
}

AnswerCommentsController.prototype = {
  init.function() {
    this.bindListeners();
    console.log("answer comments also bound!")
  },
  bindListeners: function() {

  }
}