class NewsCommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  before_action :find_news

  # GET /news/:news_id/comments
  def index
    @comments = @news.comments.select(:id, :author, :comment, :created_at).order('created_at ASC')
    render json: @comments.as_json, status: :ok
  end

  # GET /news/:news_id/comments/:id
  def show
    if @news.id == @comment.news_id
      render json: @comment.as_json(except: [:updated_at]), status: :ok
    else
      render json: "", status: :error
    end
  end

  def create
    @comment = @news.comments.build(comment_params)

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @news }
        format.json
        format.js   { render :layout => false }
      else
        format.html { redirect_to @news }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
        format.js   { render :layout => false }
      end
    end
  end

  private
	  def comment_params
	    params.require(:news_comment).permit(:author, :comment)
	  end

    def find_news
      @news = News.find(params[:news_id])
    end

    def set_comment
      @comment = NewsComment.find(params[:id])
    end

end
