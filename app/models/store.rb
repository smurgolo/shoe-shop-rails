class Store < ActiveRecord::Base
  has_many :articles, inverse_of: :store
end
