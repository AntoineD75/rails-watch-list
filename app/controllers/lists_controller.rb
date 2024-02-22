class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  def new
    @list = List.new # Needed to instantiate the form_with
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to list_path(@list), notice: "Movie was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy
    # No need for app/views/lists/destroy.html.erb
    redirect_to lists_path
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end
end
