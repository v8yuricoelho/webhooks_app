class AddIssueToEvents < ActiveRecord::Migration[6.0]
  def change
    add_reference :events, :issue
  end
end
