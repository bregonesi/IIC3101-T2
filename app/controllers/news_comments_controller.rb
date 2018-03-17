class NewsCommentsController < ApplicationController
  before_action :find_news

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
end
