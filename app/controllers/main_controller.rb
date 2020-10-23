class MainController < ApplicationController
  def main
    @articles = Article.paginate(page: params[:page], per_page: 12)
  end
end
