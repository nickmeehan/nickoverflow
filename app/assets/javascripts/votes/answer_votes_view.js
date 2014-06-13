function AnswerVotesView() {
	this.containerSelector = '.container';
	this.voteSelector = '.answer_votes';
	this.openingDataKeySelector = '[data-answer=';
	this.closingDataKeySelector = ']';
	this.voteCountSelector = '.vote_count'
}

AnswerVotesView.prototype = {
	getContainerSelector: function() {
		return $(this.containerSelector);
	},
	getVoteSelector: function() {
		return $(this.voteSelector)
	},
	getVoteCountHolder: function(targetId) {
		return $(this.openingDataKeySelector + targetId + this.closingDataKeySelector + this.voteSelector + ' ' + this.voteCountSelector)
	},
	updateVoteCount: function(event, data) {
		console.log(data)
		var $voteCountHolder = this.getVoteCountHolder(data.voted_on_id)
		$voteCountHolder.html(data.vote_count)
	}
}