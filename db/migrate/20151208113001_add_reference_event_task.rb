class AddReferenceEventTask < ActiveRecord::Migration
  def change
    add_reference :tasks, :event
  end
end
