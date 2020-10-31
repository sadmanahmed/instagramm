class PicsController < ApplicationController
before_action :find_pic, only: [:show,:edit,:update,:destroy,:upvote]
before_action :authenticate_user!,except: [:index,:show]
#before_action :correct_user, only: %i[edit update]

def index
  @pics = Pic.all.order("created_at DESC")
end

def show
end

def new
  @pic = current_user.pics.build
end

def create
  @pic = current_user.pics.build(pic_params)

  if @pic.save
    redirect_to @pic,notice: "Yesss! It is posted"
  else
    render 'new'
  end
end

def edit
end

def destroy
  @pic.destroy
  redirect_to root_path
end

def update
  if @pic.update(pic_params)
    redirect_to @pic, notice: "Congrats! Pic was updated!"
  else
    render 'edit'
  end
end

def upvote
    @pic.upvote_by current_user
    redirect_to @pic
  end





private
  def pic_params
    params.require(:pic).permit(:title,:description,:image)
  end

  def find_pic
    @pic = Pic.find(params[:id])
  end
  # def correct_user
  #   @user = User.find(params[:id])
  #   redirect_to(root_url) unless current_user?(@user)
  # end
end
