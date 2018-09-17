class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :preview, :description, :price, :quantity,
              :avg_star, :first_photo, :convert_date,:convert_clock
  belongs_to :category
  has_many :reviews
  has_many :photos
  belongs_to :user
  
  def first_photo
    id = object.id
    photos = Photo.all.where('product_id = ?',id)
    photo = photos.first
    return photo
  end

  def convert_date
   id = object.created_at
   return id.strftime("%B %e, %Y at %I:%M %p")
  end

  def convert_clock
    id = object.created_at
   return id.strftime("%I:%M %p")
  end
  
end
