class PostsController < ApplicationController
    before_action :set_post, only: [:show, :start_time, :end_time, :result]

    def index
        @posts = Post.page(params[:page]).per(10)
    end

    def new
        @post = Post.new
    end

    def start_time
        @post.start_date =  Process.clock_gettime(Process::CLOCK_MONOTONIC)
        respond_to do |format|
            if @post.save
                    format.html
                    format.js
            else
                format.js {render :new}
            end
        end
    end

    def create
        @post = Post.new(post_params)
        @post.user_id = current_user.id

        if @post.save
            redirect_to @post, notice: 'タスクが追加されました。タスクを開始しましょう！'
        else
            render :new
        end
    end

    def show

    end

    def stop 
    end

    def end_time
        @post.end_date =  Process.clock_gettime(Process::CLOCK_MONOTONIC)
        if @post.save
            redirect_to result_post_path , notice: "新しい仕事が記録されました" 
        else
            render :new
        end
    end

    def result
        @result = @post.end_date - @post.start_date
    end

    private
        def post_params
            params.require(:post).permit(:description, :price)
        end

        def set_post
            @post = Post.find(params[:id])
        end
end
