function AnswersView() {
  this.addAnswerSelector = ".add_answer";
  this.newAnswerFormSelector = ".new_answer_form"
  this.answerFeed = ".answer_feed"
  this.newAnswerSubmission = "form#new_answer"
}

AnswersView.prototype = {
  getAddAnswerForm: function() {
    return $(this.addAnswerSelector)
  },
  getAnswerFeed: function() {
    return this.answerFeed
  },
  toggleNewAnswerForm: function() {
    var answerAddSelector = this.view.newAnswerFormSelector
    $(answerAddSelector).toggleClass('hidden')
  },
  getNewAnswer: function() {
    return $(this.newAnswerSubmission)
  },
  appendNewAnswer: function(event, data) {
    console.log(data)
  }
}