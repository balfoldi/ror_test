class AddPolymorphicToLikes < ActiveRecord::Migration[6.1]
  def change
    remove_reference :likes, :post
    add_reference :likes, :liked, polymorphic: true
  end
end
