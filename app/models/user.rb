class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable
  has_one :payment
  # Esta linea se agrega porque al agregar un nuevo usuario, no solo se utilizara la informacion
  # establecida para el, sino que tambien ahora necesitara informacion para la tabla de payments.
  accepts_nested_attributes_for :payment
  has_many :images
end
