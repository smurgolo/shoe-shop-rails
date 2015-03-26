class StoresController < ApplicationController
  def stores
    @stores = Store.all
  end

  def createStore
  end

  def serviceStores
    @stores = Store.all
    respond_to do |format|
      format.html
      format.json { render :json, success: true, stores: @stores }
      format.xml { render :xml => @people.to_xml }
    end
  end
end
