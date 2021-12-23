class SearchesController < ApplicationController

  def search
    @model = params["search"]["model"]          #検索内容
    @value = params["search"]["value"]          #条件
    @how = params["search"]["how"]              #検索したいモデル
    @dates = search_for(@how, @model, @value).page(params[:page]).per(6)
    @user = current_user
  end

  private

  #完全一致
  def match(model, value)
    if model == "user"
      User.where(name: value)
    elsif model == "music"
      Music.where(title: value)
    end
  end

  #部分一致
  def partical(model, value)
    if model == 'user'
      User.where("name LIKE ?", "%#{value}%")
    elsif model == 'music'
      Music.where("title LIKE ?", "%#{value}%")
    end
  end

  def search_for(how, model, value)
    case how
    when 'match'
      match(model, value)
    when 'partical'
      partical(model, value)
    end
  end


end
