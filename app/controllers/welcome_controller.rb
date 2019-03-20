class WelcomeController < ApplicationController
  def index
  	@photos = Photo.all.includes(album: :user).last(25).reverse
  end
end
