function CommentsView() {
}

CommentsView.prototype = {
  getCommentSelector: function() {
    return $(this.commentSelector);
  },
  getCommentsHolder: function() {
    return $(this.commentsHolderSelector)
  },
  getCommentTextArea: function() {
    return $(this.commentSelector + ' ' + this.commentTextArea)
  },
  getCommentDeletionSelector: function() {
    return $(this.containerSelector + ' ' + this.commentsHolderSelector + ' ' + this.linkSelector)
  },
  appendNewComment: function(event, data) {
    var errorsContainer = this.getNewCommentErrorsSelector();
    errorsContainer.empty();
    var commentTextArea = this.getCommentTextArea();
    commentTextArea.val('');
    var commentsHolder = this.getCommentsHolder();
    commentsHolder.append(data)
  },
  getNewCommentErrorsSelector: function() {
    return $(this.commentsErrorsSelector)
  },
  appendNewCommentErrors: function(event, data) {
    var errorsContainer = this.getNewCommentErrorsSelector();
    errorsContainer.text(data.responseText);
  },
  removeComment: function(event, data) {
    $(this.commentIdSelector + data["id"]).remove();
    alert(data["message"]);
  },
  displayCommentErrors: function(event, data) {
    alert(data.responseText)
  }
}