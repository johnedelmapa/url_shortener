class LinksController < ApplicationController
  require 'pismo'
  def show
    @link = Link.find_by_slug(params[:slug]) 
    @link.update_attribute(:clicked, @link.clicked + 1)
    redirect_to @link.url
  end

  def index
    @links = Link.all
    @link = Link.new
  end

  def create
    url = params[:link][:url]
    if params[:link][:url].empty?
      flash[:danger] = "Please input url"
    else
      doc = Pismo::Document.new(url)
      flash[:success] = "Sucessfuly Created"
      Link.shorten(url, doc.title)
    end
    redirect_to root_url 
  end

  def urlaccess
    @links = Link.order('clicked desc').limit(100)
  end
end
