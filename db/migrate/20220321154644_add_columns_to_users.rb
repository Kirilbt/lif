class AddColumnsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :last_name, :string
    add_column :users, :first_name, :string
    add_column :users, :info_space, :text
    add_column :users, :info_host, :text
    add_column :users, :address, :string
  end
end
