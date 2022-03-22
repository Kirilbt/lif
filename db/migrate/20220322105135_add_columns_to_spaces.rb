class AddColumnsToSpaces < ActiveRecord::Migration[6.1]
  def change
    add_column :spaces, :info_space, :text
    add_column :spaces, :title, :string
  end
end
