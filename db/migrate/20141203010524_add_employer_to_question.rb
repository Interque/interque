class AddEmployerToQuestion < ActiveRecord::Migration
  def change
    add_reference :questions, :employer, index: true
  end
end
