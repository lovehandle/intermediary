class ApisController < ApplicationController

  def new
    @api = Api.new
  end

  def create
    @api = Api.new(api_params)

    if @api.save
      render :new
    end
  end

  def query
    @api     = Api.find(params[:id])
    @klass   = Factory.build(@api)
    @results = @klass.all(params[:query])

    respond_to do |format|
      format.json do
        render json: @results
      end
    end 
  end

  private

  def api_params
    params.require(:api).permit!
  end

end
