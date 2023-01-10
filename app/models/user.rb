class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  acts_as_followable
  acts_as_follower 
      
  has_many :user_favourite_products
  has_many :products, through: :user_favourite_products

  after_create :stripe_customer

  private

  def stripe_customer
      stripe_customer = Stripe::Customer.create({
        email: email,       
      })
      self.stripe_customer_id = stripe_customer.id
      save
  end
end
