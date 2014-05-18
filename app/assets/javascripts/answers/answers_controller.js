function AnswersController(view) {
  this.view = view;
}

AnswersController.prototype = {
  init: function() {
    this.bindListeners();
    console.log("we're bound!")
  },
  bindListeners: function() {
    var container = this.view.getContainer()
    var addAnswerFormSelector = this.view.getAddAnswerForm()
    addAnswerFormSelector.on('click', this.view.toggleNewAnswerForm.bind(this))
    var addAnswerSelector = this.view.getNewAnswer()
    container.on('ajax:success', addAnswerSelector, this.view.appendNewAnswer.bind(this))
  }
}