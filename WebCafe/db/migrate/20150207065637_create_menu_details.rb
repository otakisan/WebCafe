class CreateMenuDetails < ActiveRecord::Migration
  def change
    create_table :menu_details do |t|
      t.references :menu, index: true
      t.references :product, index: true
      t.string :recommended
      t.string :description

      t.timestamps
    end
  end
end
