class ChangeRemoteIdToBigInt < ActiveRecord::Migration
  def up
    change_column("requests", "remote_id", "string")
  end

  def down
    change_column("requests", "remote_id", "integer")
  end
end
