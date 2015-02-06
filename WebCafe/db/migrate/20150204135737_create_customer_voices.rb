class CreateCustomerVoices < ActiveRecord::Migration
  def change
    create_table :customer_voices do |t|
      t.string :situation
      t.string :voice

      t.timestamps
    end
  end
end
