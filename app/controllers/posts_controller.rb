class PostsController < ApplicationController
    before_action :set_post, only: [:show, :start_time, :end_time,:stop_time, :result, :destroy, :edit]

    def index
        @posts = current_user.posts.order(created_at: :desc).page(params[:page]).per(10)
    end

    def new
        @post = Post.new
    end
    

    def start_time
        @post.start_date =  Time.now
        @post.status = 1
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
        if @post.elapsed_time.nil?
            @post.end_date = Time.now
            @post.elapsed_time = @post.end_date - @post.start_date
            @post.hourly_wage = ((3600.to_f/@post.elapsed_time.to_f)* @post.price).round
            @post.status = 2
            if @post.save
                redirect_to result_post_path , notice: "新しい仕事が記録されました" 
            else
                render :new
            end
        else
            @post.end_date = Time.now
            final_time = @post.end_date - @post.start_date
            @post.elapsed_time = @post.elapsed_time + final_time
            @post.hourly_wage = ((3600.to_f/@post.elapsed_time.to_f)* @post.price).round
            @post.status = 2
            if @post.save
                redirect_to result_post_path , notice: "新しい仕事が記録されました" 
            else
                render :new
            end
        end
    end

    def stop_time
        if @post.elapsed_time.nil?
            @post.end_date =  Time.now
            @post.elapsed_time = @post.end_date - @post.start_date
            @post.status = 3
            if @post.save
                redirect_to posts_path , notice: "タスクが一時停止されました。
                再開するには「状態」から「再開」ボタンをクリックしてください。" 
            else
                render :new
            end
        else
            @post.end_date =  Time.now
            stop_time = @post.end_date - @post.start_date
            @post.elapsed_time = @post.elapsed_time + stop_time
            @post.status = 3
            if @post.save
                redirect_to posts_path , notice: "タスクが一時停止されました。
                再開するには「状態」から「再開」ボタンをクリックしてください。" 
            else
                render :new
            end
        end
    end

    def result
        @result = Time.at(@post.elapsed_time).utc.strftime('%-H時%-M分%-S秒')
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
            @post.elapsed_time = @post.elapsed_time * 60
            @post.hourly_wage = ((3600.to_f/@post.elapsed_time.to_f)* @post.price).round
            @post.update_attributes(hourly_wage: @post.hourly_wage, elapsed_time: @post.elapsed_time)
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