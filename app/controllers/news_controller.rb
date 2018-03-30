class NewsController < ApplicationController
  before_action :set_news, only: [:show, :edit, :update, :destroy]

  # GET /news
  def index
    @news = News.all.select(:id, :headline, :subhead, :copy, :created_at).order('created_at DESC')
    render json: @news.as_json(except: [:copy], methods: [:short_copy]), status: :ok
  end

  # GET /news/:id
  def show
    render json: @news.as_json(except: [:updated_at]), status: :ok
  end

  # POST /news
  def create
    @news = News.new(news_params)

    if @news.save
      render json: @news.as_json(except: [:updated_at]), status: :created
    else
      render json: @news.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /news/:id
  def update
    if @news.update(news_params)
      render json: @news.as_json(except: [:updated_at]), status: :ok
    else
      render json: @news.errors, status: :unprocessable_entity
    end
  end

  # DELETE /news/:id
  def destroy
    success = @news.as_json(except: [:updated_at])
    if @news.destroy
      render json: success, status: :ok
    else
      render json: {"error": "news already deleted"}, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_news
      @news = News.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def news_params
      params["news"]["headline"] = params["title"] if params["title"]
      params["news"]["subhead"] = params["subtitle"] if params["subtitle"]
      params["news"]["copy"] = params["body"] if params["body"]
      params.require(:news).permit(:headline, :subhead, :copy)
    end
end
