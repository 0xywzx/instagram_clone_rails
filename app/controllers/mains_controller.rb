class MainsController < ApplicationController
   before_action :set_main, only: [:show, :edit, :update, :destroy]
   before_action :user_only, only: [:new, :edit, :update, :destroy]

  def index
    @mains = Main.all
  end

  def edit
  end

  def confirm
    @main = Main.new(main_params)
    @main.user_id = current_user.id
    render :new if @main.invalid?
  end

  def update
    if @main.update(main_params)
      redirect_to mains_path, notice: "投稿を編集しました！"
    else
      render 'edit'
    end
  end

  def new
    if params[:back]
      @main = Main.new(main_params)
    else
      @main = Main.new
    end
  end

  def create
    @main = Main.new(main_params)
    @main.user_id = current_user.id
    @email = current_user.email
      if @main.save  
        redirect_to mains_path, notice: "投稿を作成しました！"
      else
        render 'new'
      end
  end

  def destroy
    @main.destroy
    redirect_to mains_path, notice:"投稿を削除しました！"
  end

  def show
    @favorite = current_user.favorites.find_by(main_id: @main.id)
  end

  private

  def main_params
    params.require(:main).permit(:comment, :image, :image_cache)
  end

  def set_main
    @main = Main.find(params[:id])
  end

  def user_only
    if logged_in?
    else
      redirect_to "/sessions/new"
    end
  end
end
