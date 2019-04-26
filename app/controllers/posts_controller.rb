class PostsController < ApplicationController
    def index
        @posts = Post.all
    end

    def show
        @post = Post.find(params[:id])
    end

    def new
    end

    def edit
        @post = Post.find(params[:id])
    end

    def create
        @post = Post.new(post_params)

        @post.save
        redirect_to @post
        # render plain: params[:post].inspect
    end

    def update
        @post = Post.find(params[:id])

        @post.update(post_params)
        redirect_to @post
    end

    def destroy
        @post = Post.find(params[:id])
        @post.destroy

        redirect_to root_path
    end

    private
        def post_params
            params.require(:post).permit(:author_name, :photo_url, :title, :caption)
        end
end




# class Posts < ActiveRecord::Migration[5.2]
#   def change
#         create_table :posts do |t|
#             t.string :author_name
#             t.string :photo_url
#             t.string :title
#             t.timestamps
#         end
#     end
# end
