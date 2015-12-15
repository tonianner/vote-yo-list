class AddVotesInLocation < ActiveRecord::Migration
  def change
    add_column :locations, :votes, :integer, :default => 0
  end
end
