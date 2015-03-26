class Article < ActiveRecord::Base
  belongs_to :store, inverse_of: :articles
end
