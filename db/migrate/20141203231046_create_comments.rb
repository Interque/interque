class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :description
      t.references :user, index: true
      t.references :question, index: true
      t.references :answer, index: true

      t.timestamps
    end
  end
end
