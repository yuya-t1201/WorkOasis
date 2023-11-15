class ReviewsController < ApplicationController
  before_action :set_review, only: [:edit, :update, :destroy]
  before_action :set_workspace, only: [:new, :create, :edit, :update, :destroy]

  def new
    @review = Review.new
  end

  def edit; end

  def create
    @review = Review.new(review_params)
    if @review.save
      redirect_to workspace_path(@workspace), notice: 'レビューが作成されました'
    else
      render :new
    end
  end

  def update
    if @review.update(review_params)
      redirect_to workspace_path(@workspace), notice: 'レビューが更新されました'
    else
      render :edit
    end
  end

  def destroy
    @review.destroy
    redirect_to workspace_path(@workspace), notice: 'レビューが削除されました'
  end

  private

  def set_review
    @review = Review.find(params[:id])
  end

  def set_workspace
    @workspace = Workspace.find(params[:workspace_id])
  end

  def review_params
    params.require(:review).permit(:comment, :rating, :comfort, :convenience, :environmental_noise, :ease_of_work, :coziness).merge(
      user_id: current_user.id, workspace_id: params[:workspace_id]
    )
  end
end
