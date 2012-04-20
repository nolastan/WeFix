class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.integer :remote_id
      t.string :token
      t.string :status
      t.string :service_name
      t.integer :service_id
      t.text :description
      t.string :city_update_datetime
      t.string :requested_datetime
      t.string :address
      t.string :lat
      t.string :long
      t.string :media_url

      t.timestamps
    end
  end
end
