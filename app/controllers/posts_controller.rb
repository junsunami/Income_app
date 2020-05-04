class PostsController < ApplicationController

    def new
        @Post = Post.all
    end

    def start_time
        @post = Post.new
        @post.user_id = current_user.id
        @post.start_date =  Process.clock_gettime(Process::CLOCK_MONOTONIC)
        if @post.save
            redirect_to stop_posts_path
        else
        end
    end

    def stop 
    end

    def end_time
        @post = Post.find(1)
        @post.end_date =  Process.clock_gettime(Process::CLOCK_MONOTONIC)
        if @post.save
            redirect_to result_posts_path , notice: "新しい仕事が記録されました" 
        else
            render :new
        end
    end

    def result
        @post = Post.find(1)
        @result = @post.end_date - @post.start_date
    end

    private
        def post_params
            params.require(:post).permit(:start_date, :end_date, :description)
        end
end
