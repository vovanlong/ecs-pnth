class CategorySerializer < ActiveModel::Serializer
  attributes :id, :name, :parent_id

  def category_parent
    id = object.id
    category = Category.all.where('parent_id = ?', id)
      {status: "success",categoryid: category}
  end
  
end
