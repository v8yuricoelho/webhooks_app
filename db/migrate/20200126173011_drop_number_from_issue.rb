class DropNumberFromIssue < ActiveRecord::Migration[6.0]
  def change
    remove_column :issues, :number
  end
end
