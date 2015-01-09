class AddModerationToQuestion < ActiveRecord::Migration
  def change
    add_column :questions, :approved, :boolean, default: false
  end
end
