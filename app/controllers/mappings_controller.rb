class MappingsController < ApplicationController

  def new
    @mapping = Mapping.new
  end

  def create
    @mapping = Mapping.new(mapping_params)

    if @mapping.save
      render :new
    end
  end

  private

  def mapping_params
    params.require(:mapping).permit!
  end

end
