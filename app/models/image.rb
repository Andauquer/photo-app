class Image < ActiveRecord::Base
  belongs_to :user
  # Con este definimos que las imagenes que trabajaremos con Carrierwave estaran asociadas con este model
  # y mount_uploader es el metodo para lograr eso, PictureUploader es el uploader que generamos, y :picture
  # es el atributo name para las imagenes en nuestro modelo.
  mount_uploader :picture, PictureUploader
  
  private
  
  def picture_size
    if picture_size > 5.megabytes
      errors.add(:picture, "Should be less than 5MB")
    end
  end
end
