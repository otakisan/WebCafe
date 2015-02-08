class CreateMenus < ActiveRecord::Migration
  def change
    create_table :menus do |t|
      t.string :name
      t.datetime :start_at
      t.datetime :end_at
      t.string :description

      t.timestamps
    end
  end
end
