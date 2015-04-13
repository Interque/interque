class CreateReadNotifications < ActiveRecord::Migration
  def change
    create_table :read_notifications do |t|
      t.references :user, index: true
      t.datetime :read_at, :default => nil

      t.timestamps
    end
  end
end
