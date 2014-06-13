function AnswerCommentsController(view) {
  this.view = view;
}

AnswerCommentsController.prototype = {
  init: function() {
    this.bindListeners();
  },
  bindListeners: function() {
    var $answerCommentSelector = this.view.getCommentSelector();
    $answerCommentSelector.on('ajax:success', this.view.appendNewComment.bind(this.view))
    $answerCommentSelector.on('ajax:error', this.view.appendNewCommentErrors.bind(this.view))
    var $commentDeletionSelector = this.view.getCommentDeletionSelector();
    $commentDeletionSelector.on('ajax:success', this.view.removeComment.bind(this.view))
    $commentDeletionSelector.on('ajax:error', this.view.displayCommentErrors.bind(this.view))
  }
}