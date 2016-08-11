
require 'rails_helper'

class Api::V1::PostsController < Api::V1::BaseController

   before_action :authenticate_user, except: [:index, :show]
   before_action :authorize_user, except: [:index, :show]


   def update

     @topic = Topic.find(params[:topic_id])
     post = Post.find(params[:id])
     post.assign_attributes(post_params)

    if post.update_attributes(post_params)

      render :json => @topic.to_json( :include =>  :post ), status: 200
    else
      render json: {error: "Post update failed", status: 400}, status: 400
    end

   end




   def create

     @topic = Topic.find(params[:topic_id])
     @post = @topic.posts.build(post_params)

     if @post.valid?
        @post.save!
        render :json => @topic.to_json( :include =>  :post ), status: 200
     else
        render json: {error: "Post is invalid", status: 400}, status: 400
     end

   end



   def destroy

     @topic = Topic.find(params[:topic_id])
     post = Post.find(params[:id])

    if post.destroy
      render json: {message: "Post destroyed", status: 200}, status: 200
    else
      render json: {error: "Post destroy failed", status: 400}, status: 400
    end

   end



  private

      def post_params
        params.require(:POST).permit(:title, :body)
      end

end

      #@topic = Topic.find(params[:id])
      #render json: topic, status: 200
      #render :json => @topic.to_json( :include =>  :posts ), status: 200
      #format.json { render json: @post.to_json(:include => :comments) }
