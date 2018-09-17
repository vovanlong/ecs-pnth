class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :price, :quantity,
              :avg_star, :first_photo
  belongs_to :category

  def first_photo
    id = object.id
    photos = Photo.all.where('product_id = ?',id)
    photo = photos.first
    return photo
  end
  
end
