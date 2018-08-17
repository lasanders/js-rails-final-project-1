class UsersSerializer < ActiveModel::Serializer
  attributes :id, :name, :password, :taste, :employee, :cash, :appetite, :provider, :uid, :email

  has_many :purchases
  has_many :candies, through: :purchases
end
