class CreateReadNotifications < ActiveRecord::Migration
  def change
    create_table :read_notifications do |t|
      t.references :user, index: true
      t.integer :user_approved_questions
      t.integer :votes_on_user_answers
      t.integer :answers_on_user_questions
      t.datetime :read_at, :default => nil

      t.timestamps
    end
  end
end
