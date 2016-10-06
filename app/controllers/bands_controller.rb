class BandsController < ApplicationController

  def new
    @band = Band.new
  end

  def index
  end

  def create
    @band = Band.new(band_params)
    if @band.valid?
      @band.save
      redirect_to band_url(@band)
    else
      flash[:errors] = band.errors.full_messages
      render new_band_url
    end
  end

  def show
    @band = Band.find_by_id(params[:id])
    render :show
  end

  def edit
    @band = Band.find_by_id(params[:id])
    render :edit
  end

  def update
    @band = Band.find_by_id(params[:id])
    if @band.update(band_params)
    end
  end

  def destroy

  end

  private
  def find_band
    @band = Band.find_by_id(params[:id])
  end

  def band_params
    params.require(:band).permit(:name)
  end
end
