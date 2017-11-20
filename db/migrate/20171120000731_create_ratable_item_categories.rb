class CreateRatableItemCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :ratable_item_categories do |t|
      t.string :name

      t.timestamps
    end
  end
end
