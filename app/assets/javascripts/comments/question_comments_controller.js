function QuestionCommentsController(view) {
  this.view = view;
}

QuestionCommentsController.prototype = {
  init: function() {
    this.bindListeners();
    console.log("question comments also bound!")
  },
  bindListeners: function() {
    var container = this.view.getContainer();
    var questionCommentSelector = this.view.getQuestionCommentSelector();
    container.on('ajax:success', questionCommentSelector, this.view.appendNewQuestionComment.bind(this))
    container.on('ajax:error', questionCommentSelector, this.view.appendNewQuestionCommentErrors.bind(this))
  }
}