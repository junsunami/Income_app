class PostsController < ApplicationController
    before_action :set_post, only: [:show, :start_time, :end_time, :result, :destroy, :edit]

    def index
        @posts = current_user.posts.page(params[:page]).per(10)
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
        @post.elapsed_time = @post.end_date - @post.start_date
        @post.hourly_wage = (3600/@post.elapsed_time)* @post.price
        @post.status = 1
        if @post.save
            redirect_to result_post_path , notice: "新しい仕事が記録されました" 
        else
            render :new
        end
    end

    def result
        @result = Time.at(@post.end_date - @post.start_date).utc.strftime('%-H時%-M分%-S秒')
    end

    def destroy
        @post.delete
        redirect_to posts_path, notice: 'タスクが正常に削除されました'
    end

    def edit
        
    end

    def update
        @post = Post.find_by(id: params[:id])
        if @post.update(post_params)
            @post.hourly_wage = (3600/@post.elapsed_time)* @post.price
            @post.update(post_params)
            redirect_to posts_path, notice: 'タスクが正常に更新されました'
        else
            render :edit
        end
    end


    private
        def post_params
            params.require(:post).permit(:description, :price, :elapsed_time)
        end

        def set_post
            @post = Post.find(params[:id])
        end
end