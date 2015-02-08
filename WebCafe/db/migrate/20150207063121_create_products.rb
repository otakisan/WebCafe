class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :category
      t.string :limited
      t.datetime :start_at
      t.datetime :end_at
      t.string :remarks

      t.timestamps
    end
  end
end
