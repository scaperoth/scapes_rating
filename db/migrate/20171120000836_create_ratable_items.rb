class CreateRatableItems < ActiveRecord::Migration[5.1]
  def change
    create_table :ratable_items do |t|
      t.string :name
      t.integer :rating
      t.belongs_to :ratable_item_category

      t.timestamps
    end
  end
end
