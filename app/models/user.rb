class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :photo

  #### Followers e Seguiti

  # Will return an array of follows for the given user instance --- follows generici che devono esere scremati nel prosimo passaggio
  has_many :received_follows, foreign_key: :followed_user_id, class_name: "Follow"

  # Will return an array of users who follow the user instance -- coloro i quali seguono lo user (i followers)
  has_many :followers, through: :received_follows, source: :follower

  #######################################

 # returns an array of follows a user gave to someone else
  has_many :given_follows, foreign_key: :follower_id, class_name: "Follow"

  # returns an array of other users who the user has followed -- i seguiti dallo user
  has_many :followings, through: :given_follows, source: :followed_user

end
