class ApisController < ApplicationController

  inherit_resources

  custom_actions resource: [ :query ]

  respond_to :json

  def query
    @klass   = Factory.build(resource)
    @results = @klass.all(params[:query])

    respond_to do |format|
      format.json do
        respond_with @results
      end
    end 
  end

end
