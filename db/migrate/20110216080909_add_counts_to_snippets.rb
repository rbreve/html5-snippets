class AddCountsToSnippets < ActiveRecord::Migration
  def self.up
    add_column :snippets, :reports_count, :integer
    add_column :snippets, :saves_count, :integer
  end

  def self.down
    remove_column :snippets, :saves_count
    remove_column :snippets, :reports_count
  end
end
