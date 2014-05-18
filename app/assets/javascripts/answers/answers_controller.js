function AnswersController(view) {
  this.view = view;
}

AnswersController.prototype = {
  init: function() {
    this.bindListeners();
    console.log("we're bound!")
  },
  bindListeners: function() {
    var addAnswerFormSelector = this.view.getAddAnswerForm()
    addAnswerFormSelector.on('click', this.view.toggleNewAnswerForm.bind(this))
    var addAnswerSelector = this.view.getNewAnswer()
     .on('ajax:success', this.view.appendNewAnswer.bind(this))
  }
}