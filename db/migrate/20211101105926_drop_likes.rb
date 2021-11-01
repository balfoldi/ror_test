class DropLikes < ActiveRecord::Migration[6.1]
  def change
    drop_table :table_name
  end
end
