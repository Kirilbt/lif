class AddAddressToSpaces < ActiveRecord::Migration[6.1]
  def change
    add_column :spaces, :address, :string
  end
end
