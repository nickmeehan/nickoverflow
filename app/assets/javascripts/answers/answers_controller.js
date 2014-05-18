function AnswersController(view) {
  this.view = view;
}

AnswersController.prototype = {
  init: function() {
    this.bindListeners();
    console.log("we're bound!")
  },
  bindListeners: function() {
    var addAnswerSelector = this.view.getAddAnswer()
    addAnswerSelector.on('ajax:success', this.view.appendNewAnswerForm)
  }
}