json.extract! news, :id, :headline, :subhead, :copy, :date, :created_at, :updated_at
json.url news_url(news, format: :json)
