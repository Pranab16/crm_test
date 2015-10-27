class CreateLead < ActiveRecord::Migration
  def change
    create_table :leads do |t|
      t.text :description
      t.string :customer_name
      t.string :customer_phone
      t.string :internal_uid
      t.string :status
      t.integer :value
      t.datetime :scheduled_time

      t.timestamps null: false
    end
  end
end
