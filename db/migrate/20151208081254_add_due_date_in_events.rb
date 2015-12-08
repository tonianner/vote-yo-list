class AddDueDateInEvents < ActiveRecord::Migration
  def change
    add_column :events, :due_date, :date
  end
end
