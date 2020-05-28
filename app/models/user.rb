class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable
  has_one :payment
  accepts_nested_attributes_for :payment
  has_many :images
  has_many :friendships
  has_many :friends, through: :friendships
  has_many :comments, dependent: :destroy

  def self.search(param)
    param.strip!
    to_send_back = (email_matches(param)).uniq
    return nil unless to_send_back
    to_send_back
  end



  def self.email_matches(param)
    matches('email', param)
  end

  def self.matches(field_name, param)
    where("#{field_name} like ?", "%#{param}%")
  end


end
