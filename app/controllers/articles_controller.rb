class ArticlesController < ApplicationController
  respond_to :html
  respond_to :xml, :json, only: [ :store, :allArticles ]


  def index

    @articles = Article.all
  end

  def show
    @articles = Article.find(params[:article_id])
  end

  def create
    # save new article of a store, post method

    @article = Article.create(name: params[:article][:name], description:params[:article][:description], price: params[:article][:price],
    total_in_shelf: params[:article][:total_in_shelf], total_in_vault: params[:article][:total_in_vault], store_id: params[:article][:store])
    if @article.save
      # pass data to next action. Later you can show a message with this data
      # flash[:notice] = "Store successfully created"
      redirect_to(articles_path)
    else
      redirect_to(new_article_path)
    end
  end

  def new
    @stores = Store.all
  end

  def destroy
  end

  def store
    @store = Store.find(params[:store_id])
    @articles = @store.articles
    xml = Builder::XmlMarkup.new
    xml.instruct!
    xml.articles do
      @articles.each { |article|
        xml.id article.id
        xml.description article.description
        xml.name article.name
        xml.price article.price
        xml.total_in_shelf article.total_in_shelf
        xml.total_in_vault article.total_in_vault
        xml.store_name article.store.name
      }
    end
    xml.success(!@articles.empty?)
    xml.total_elements(@articles.count)
    respond_to do |format|
      format.json
      format.xml { render :xml => xml.target! }
    end
  end

  def allArticles
    @articles = Article.all
    xml = Builder::XmlMarkup.new
    xml.instruct!
    xml.articles do
      @articles.each { |article|
        xml.id article.id
        xml.description article.description
        xml.name article.name
        xml.price article.price
        xml.total_in_shelf article.total_in_shelf
        xml.total_in_vault article.total_in_vault
        xml.store_name article.store.name
      }
    end
    xml.success(!@articles.empty?)
    xml.total_elements(@articles.count)
    respond_to do |format|
      format.html { redirect_to(articles_path) }
      format.json
      format.xml { render :xml => xml.target! }
    end
  end
end
