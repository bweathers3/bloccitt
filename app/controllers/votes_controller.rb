class VotesController < ApplicationController


  before_action :require_sign_in

=begin to DRY code
   def up_vote
     @post = Post.find(params[:post_id])
     @vote = @post.votes.where(user_id: current_user.id).first

     if @vote
       @vote.update_attribute(:value, 1)
     else
       @vote = current_user.votes.create(value: 1, post: @post)
     end

     redirect_to :back
   end

=end

def up_vote
    update_vote(1)
    redirect_to :back
end

=begin to DRY code
   def down_vote
       @post = Post.find(params[:post_id])
       @vote = @post.votes.where(user_id: current_user.id).first

       if @vote
         @vote.update_attribute(:value, -1)
       else
         @vote = current_user.votes.create(value: -1, post: @post)
       end

       redirect_to :back
     end
=end


def down_vote
    update_vote(-1)
    redirect_to :back
  end

  private
  
  def update_vote(new_value)
    @post = Post.find(params[:post_id])
    @vote = @post.votes.where(user_id: current_user.id).first

    if @vote
      @vote.update_attribute(:value, new_value)
    else
      @vote = current_user.votes.create(value: new_value, post: @post)
    end
  end



end