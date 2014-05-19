function QuestionCommentsController(view) {
  this.view = view;
}

QuestionCommentsController.prototype = {
  init: function() {
    this.bindListeners();
    console.log("question comments also bound!")
  },
  bindListeners: function() {
    var questionCommentSelector = this.view.getCommentSelector();
    questionCommentSelector.on('ajax:success', this.view.appendNewComment.bind(this.view))
    questionCommentSelector.on('ajax:error', this.view.appendNewCommentErrors.bind(this.view))
    var commentDeletionSelector = this.view.getCommentDeletionSelector();
    console.log(commentDeletionSelector);
    commentDeletionSelector.on('ajax:success', this.view.removeComment.bind(this.view))
  }
}