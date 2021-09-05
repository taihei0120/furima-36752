class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string      :postal_code,       null: false
      t.integer     :delivery_from_id,  null: false
      t.string      :town,              null: false
      t.string      :home_number,       null: false
      t.string      :building
      t.string      :telephone,         null: false
      t.references  :order,             null: false, foreign_key: true
      t.timestamps
    end
  end
end
