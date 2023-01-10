class Product < ApplicationRecord
  mount_uploader :image, ImageUploader

  has_many :user_favourite_products
  has_many :users, through: :user_favourite_products
  belongs_to :category
  
  validates :branch_name, :title, :description, :price, :product_type, :model_number, :image, presence: true
  
  after_create :stripe_price

  private

  def stripe_price
    product = Stripe::Product.create({name: title})
    Stripe::Price.create({
      unit_amount: price.to_i,
      currency: 'usd',
      recurring: {interval: 'month'},
      product: product.id,
    })    
  end
end
