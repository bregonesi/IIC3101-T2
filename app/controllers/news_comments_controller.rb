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
      render json: {"error": "comment id does not match with news id"}, status: :unprocessable_entity
    end
  end

  # POST /news/:news_id/comments
  def create
    @comment = @news.comments.build(comment_params)

    if @comment.save
      render json: @comment.as_json(except: [:updated_at]), status: :created
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /news/:id
  def update
    if params["news_comment"]["id"] != @comment.id
      render json: {"error": "comment id does not match with param id"}, status: :unprocessable_entity
    else
      if @comment.update(comment_params)
        render json: @comment.as_json(except: [:updated_at]), status: :ok
      else
        render json: @comment.errors, status: :unprocessable_entity
      end
    end
  end

  # DELETE /news/:id
  def destroy
    success = @comment.as_json(except: [:updated_at])
    if @comment.destroy
      render json: success, status: :ok
    else
      render json: {"error": "comment already deleted"}, status: :unprocessable_entity
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
