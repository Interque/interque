class AddBountyToQuestion < ActiveRecord::Migration
  def change
    add_column :questions, :bounty, :boolean, :default => false
  end
end
