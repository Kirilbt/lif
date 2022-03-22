class RemoveInfoSpaceFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :info_space, :text
  end
end
