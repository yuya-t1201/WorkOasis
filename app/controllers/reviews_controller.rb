class ReviewsController < ApplicationController

  def new
    @workspace = Workspace.find(params[:workspace_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.rating = params[:review][:rating].to_i
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
    params.require(:review).permit(:comment, :rating).merge(
      user_id: current_user.id, workspace_id: params[:workspace_id]
    )
  end

end
