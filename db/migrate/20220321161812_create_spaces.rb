class CreateSpaces < ActiveRecord::Migration[6.1]
  def change
    create_table :spaces do |t|
      t.references :user, null: false, foreign_key: true
      t.string :category
      t.float :price_day
      t.boolean :available, default: true

      t.timestamps
    end
  end
end
