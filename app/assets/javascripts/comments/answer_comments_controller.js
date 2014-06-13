function AnswerCommentsController(view) {
  this.view = view;
}

AnswerCommentsController.prototype = {
  init: function() {
    this.bindListeners();
  },
  bindListeners: function() {
    var $container = ContainerSelector.retrieve();
    $container.on('ajax:success', this.view.commentSelector,this.view.appendNewComment.bind(this.view))
    $container.on('ajax:error', this.view.commentSelector,this.view.appendNewCommentErrors.bind(this.view))
    var $commentDeletionSelector = this.view.getCommentDeletionSelector();
    $commentDeletionSelector.on('ajax:success', this.view.removeComment.bind(this.view))
    $commentDeletionSelector.on('ajax:error', this.view.displayCommentErrors.bind(this.view))
  }
}