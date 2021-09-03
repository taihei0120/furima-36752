class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string     :product_name,         null: false
      t.text       :product_description,  null: false
      t.integer    :product_category_id,  null: false
      t.integer    :product_condition_id, null: false
      t.integer    :delivery_fee_id,      null: false
      t.integer    :delivery_from_id,     null: false
      t.integer    :delivery_day_id,      null: false
      t.integer    :price,                null: false
      t.references :user,                 null: false, foreign_key: true

      t.timestamps
    end
  end
end
