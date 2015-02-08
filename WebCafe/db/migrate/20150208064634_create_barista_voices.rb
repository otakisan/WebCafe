class CreateBaristaVoices < ActiveRecord::Migration
  def change
    create_table :barista_voices do |t|
      t.string :situation
      t.string :voice
      t.string :voice_attribute
      t.string :counter_voice_attribute

      t.timestamps
    end
  end
end
