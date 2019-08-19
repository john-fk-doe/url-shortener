class LinksController < ApplicationController
  before_action :find_link, only: [:show, :visit]

  def index
    @link = Link.new
  end

  def show
  end

  def create
    @link = Link.new(link_params)

    if @link.save
      redirect_to link_path(@link.short), notice: 'Link was successfully created.'
    else
      render :index
    end
  end

  def visit
    Visit.create!(ip: request.remote_ip, link: @link)

    redirect_to @link.original
  end

  private
    def find_link
      @link = Link.find_shorten!(params[:url])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def link_params
      params.require(:link).permit(:short, :original)
    end
end
