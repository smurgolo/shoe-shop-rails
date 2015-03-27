class StoresController < ApplicationController
  def index

  end

  def show

  end

  def create
    # save new store, post method
  end

  def new
    # return html with form to create new store
  end


  def allStores
    @stores = Store.all
    respond_to do |format|
      format.html
      format.json { render :json, success: true, stores: @stores }
      format.xml { render :xml => @people.to_xml }
    end
  end


  def destroy
    # Rails would dispatch that request to the destroy method on the photos controller with { id: '17' } in params.
  end

  def update

  end
end
