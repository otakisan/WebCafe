class AddVoiceAttributeToCustomerVoices < ActiveRecord::Migration
  def change
    add_column :customer_voices, :voice_attribute, :string
    add_column :customer_voices, :counter_voice_attribute, :string
  end
end
