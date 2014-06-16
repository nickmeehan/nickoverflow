function AnswerVotesView() {
	this.voteSelector = '.answer_votes';
	this.openingDataKeySelector = '[data-answer=';
	this.closingDataKeySelector = ']';
	this.voteCountSelector = '.vote_count'
	this.voteCountText = 'h2'
}

AnswerVotesView.prototype = {
	getVoteCountHolder: function(targetId) {
		return $(this.openingDataKeySelector + targetId + this.closingDataKeySelector + this.voteSelector + ' ' + this.voteCountSelector + ' ' + this.voteCountText)
	},
	updateVoteCount: function(event, data) {
		var $voteCountHolder = this.getVoteCountHolder(data.voted_on_id)
		$voteCountHolder.text(data.vote_count)
	}
}