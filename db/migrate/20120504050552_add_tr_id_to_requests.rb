class AddTrIdToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :tr_id, :string
  end
end
