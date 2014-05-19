function AnswersView() {
  this.addAnswerSelector = ".add_answer";
  this.newAnswerFormSelector = ".new_answer_form"
  this.answerFeed = ".answer_feed"
  this.newAnswerSubmission = "form#new_answer"
  this.containerSelector = '.container'
  this.newAnswerErrorsSelector = '.new_answer_errors'
}

AnswersView.prototype = {
  getAddAnswerForm: function() {
    return $(this.addAnswerSelector)
  },
  getAnswerFeed: function() {
    return $(this.answerFeed)
  },
  getContainer: function() {
    return $(this.containerSelector)
  },
  getNewAnswerErrorsContainer: function() {
    return $(this.newAnswerErrorsSelector)
  },
  toggleNewAnswerForm: function() {
    var answerAddSelector = this.view.newAnswerFormSelector
    $(answerAddSelector).toggleClass('hidden')
  },
  getNewAnswer: function() {
    return $(this.newAnswerSubmission)
  },
  appendNewAnswer: function(event, data) {
    var answerAddSelector = this.view.newAnswerFormSelector
    $(answerAddSelector).toggleClass('hidden')
    var errorsContainer = this.view.getNewAnswerErrorsContainer()
    errorsContainer.empty()
    var answerFeed = this.view.getAnswerFeed()
    answerFeed.append(data)
  },
  appendNewAnswerErrors: function(event, data) {
    var errorsContainer = this.view.getNewAnswerErrorsContainer()
    errorsContainer.text(data.responseText)
  }
}