class CommentsController < ApplicationController

  before_action :require_sign_in

  before_action :authorize_user, only: [:destroy]

  #before_action :authorize_user, only: [:create, :destroy]

#  @post = Post.find(params[:post_id])
# comment = @post.comments.new(comment_params)
 #comment.user = current_user


     def create

       comment = Comment.new(comment_params) # moved up
       comment.user = current_user # moved up

        if params.has_key?(:post_id)

          @post = Post.find(params[:post_id]) ## stayed
           @post.comments << comment #added

           if comment.save
             flash[:notice] = "Comment saved successfully."
             redirect_to [@post.topic, @post]
           else
             flash[:alert] = "Comment failed to save."
             redirect_to [@post.topic, @post]
           end

         else

           @topic = Topic.find(params[:topic_id])
            @topic.comments << comment

            if comment.save
              flash[:notice] = "Comment saved successfully."
              redirect_to [@topic]
            else
              flash[:alert] = "Comment failed to save."
              redirect_to [@topic]
            end

         end

    end


###############


         def destroy


           if params.has_key?(:post_id)

              @post = Post.find(params[:post_id])
              comment = @post.comments.find(params[:id])

              if comment.destroy
                flash[:notice] = "Comment was deleted successfully."
                redirect_to [@post.topic, @post]
              else
                flash[:alert] = "Comment couldn't be deleted. Try again."
                redirect_to [@post.topic, @post]
              end

            else

              @topic = Topic.find(params[:topic_id])
              comment = @topic.comments.find(params[:id])

              if comment.destroy
                flash[:notice] = "Comment was deleted successfully."
                redirect_to [@topic]
              else
                flash[:alert] = "Comment couldn't be deleted. Try again."
                redirect_to [@topic]
              end

          end

    end



         private

         def comment_params
           params.require(:comment).permit(:body)
         end



        def authorize_user

          params.has_key?(:post_id) ?  comment = Comment.find(params[:post_id])  : comment = Comment.find(params[:topic_id])
          unless current_user == comment.user || current_user.admin?
            flash[:alert] = "You do not have permission to delete a comment."
            redirect_to [comment.post.topic, comment.post]
          end
        end

end
