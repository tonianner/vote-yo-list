class AddVotesInLocation < ActiveRecord::Migration
  def change
    add_column :locations, :votes, :integer
  end
end
