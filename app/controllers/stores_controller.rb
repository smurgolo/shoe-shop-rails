class StoresController < ApplicationController
  respond_to :html
  respond_to :xml, :json, only: [ :allStores ]
  def index
    @stores = Store.all
  end

  def show
    @store = Store.find(params[:store_id])
  end

  def create
    # save new store, post method

    @store = Store.create(name: params[:store][:name], address: params[:store][:address])
    if @store.save
      # pass data to next action. Later you can show a message with this data
      # flash[:notice] = "Store successfully created"
      redirect_to(stores_path)
    else
      redirect_to(new_store_path)
    end
  end

  def new
    # return html with form to create new store
  end


  def allStores
    @stores = Store.all
    xml = Builder::XmlMarkup.new
    xml.instruct!
    xml.stores do
      @stores.each { |store|
        xml.id store.id
        xml.address store.address
        xml.name store.name
      }
    end
    xml.success(!@stores.empty?)
    xml.total_elements(@stores.count)

    json.success !@stores.empty?
    json.total_elements @stores.count
    respond_to do |format|
      format.html { redirect_to(stores_path) }
      format.json
      format.xml {  render :xml => xml.target! }
    end
  end


  def destroy
    # Rails would dispatch that request to the destroy method on the photos controller with { id: '17' } in params.
    @store = Store.find(params[:store])
    @store.destroy
    redirect_to(stores_path)
  end

  def edit
    @store = Store.find(params[:store_id])
  end

  def update

  end
end
