class PostsController < ApplicationController
  def index
    @posts = Post.where(user_id: session[:user_id]).order(created: :DESC)
  end

  def new
    @post = Post.new
  end

  def create
    user = User.find_by(id: session[:user_id])
    @post = user.posts.build(post_params)
    if @post.save
      flash[:notice] = "投稿しました"
      redirect_to index_path      
    else
      flash[:notice] = "投稿できません"
      render 'new'
    end
  end

  def show
    @post = Post.find_by(id: params[:id])
    if @post.dfg == 1
      flash[:notice] = "投稿は存在しません"
      redirect_to index_path
    end
  end

  def edit
    @post = Post.find_by(id: params[:id])
    if @post.dfg == 1
      flash[:notice] = "投稿は存在しません"
      redirect_to index_path
    end
  end

  def update
    @post = Post.find_by(id: params[:id])
    if @post.update(post_params)
      flash[:notice] = "編集しました"
      redirect_to index_path
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    @post.dfg = 1
    @post.save
    flash[:notice] = "削除されました"
    redirect_to index_path
  end

  private

    def post_params
      params.require(:post).permit(:title, :body)
    end
end
