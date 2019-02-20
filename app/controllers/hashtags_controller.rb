class HashtagsController < ApplicationController
  def show

    binding.pry

    @search = Search.new(term: hashtag)
  end

  private

  def hashtag
    "##{params[:id]}"
  end
end
