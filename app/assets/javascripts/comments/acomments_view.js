function CommentsView() {
}

CommentsView.prototype = {
  getCommentSelector: function() {
    return $(this.commentSelector);
  },
  getCommentsHolder: function(targetId) {
    return $(this.openingDataKeySelector + targetId + this.closingDataKeySelector + this.commentsHolderSelector)
  },
  getCommentTextArea: function(targetId) {
    return $(this.commentSelector + this.openingDataKeySelector + targetId + this.closingDataKeySelector + ' ' + this.commentTextArea)
  },
  getCommentDeletionSelector: function() {
    return $(this.containerSelector + ' ' + this.commentsHolderSelector + ' ' + this.linkSelector)
  },
  appendNewComment: function(event, data) {
    console.log(data)
    var errorsContainer = this.getNewCommentErrorsSelector();
    errorsContainer.empty();
    var commentTextArea = this.getCommentTextArea(data["target_id"]);
    commentTextArea.val('');
    var commentsHolder = this.getCommentsHolder(data["target_id"]);
    commentsHolder.append(data["template"])
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