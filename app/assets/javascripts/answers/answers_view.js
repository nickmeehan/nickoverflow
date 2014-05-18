function AnswersView() {
  this.addAnswerSelector = ".add_answer";
  this.newAnswerFormSelector = ".new_answer_form"
  this.answerFeed = ".answer_feed"
  this.newAnswerSubmission = "form#new_answer"
  this.containerSelector = '.container'
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
    var answerFeed = this.view.getAnswerFeed()
    answerFeed.append(data)
  }
}