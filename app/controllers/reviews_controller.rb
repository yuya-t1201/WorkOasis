class ReviewsController < ApplicationController

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    if @review.save
      redirect_to workspace_path(@review.workspace), notice: 'レビューが作成されました'
    else
      render :new
    end
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    if @review.update(review_params)
      redirect_to workspace_path(@review.workspace), notice: 'レビューが更新されました'
    else
      render :edit
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to workspace_path(@review.workspace), notice: 'レビューが削除されました'
  end

  private

  def review_params
    params.require(:review).permit(:comment, :all_rating, :rating1, :rating2, :rating3, :rating4).merge(
      user_id: current_user.id, workspace_id: params[:workspace_id]
    )
  end

end
