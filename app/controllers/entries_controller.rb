class EntriesController < ApplicationController
  before_action :authenticate_user!

  def new
    @entry = Entry.new(place_id: params[:place_id])
  end

  def create
    @entry = current_user.entries.new(entry_params)
    if @entry.save
      @entry.image.attach(params[:entry][:image])
      redirect_to place_path(@entry.place_id), notice: "Entry created successfully"
    else
      render :new
    end
  end

  private

  def entry_params
    params.require(:entry).permit(:title, :description, :occurred_on, :place_id, :image)
  end
end
