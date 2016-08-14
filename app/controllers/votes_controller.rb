class VotesController < ApplicationController


  before_action :require_sign_in


def up_vote
    update_vote(1)

    respond_to do |format|
       format.html
       format.js
    end
end

## thanks Richard for all the extra help

def down_vote
    update_vote(-1)

    respond_to do |format|
       format.html
       format.js
    end
end

  private

  def update_vote(new_value)
    @post = Post.find(params[:post_id])
    @vote = @post.votes.where(user_id: current_user.id).first
#Rails.logger.info "*******************************"
#Rails.logger.info @vote.inspect
#Rails.logger.info @post.points

    if @vote
#Rails.logger.info "if @vote = true"


      @vote.update_attribute(:value, new_value)
#Rails.logger.info @vote.inspect
#Rails.logger.info @post.points
    else
      @vote = current_user.votes.create(value: new_value, post: @post)
    end

    end

end
