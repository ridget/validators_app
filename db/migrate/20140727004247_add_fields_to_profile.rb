class AddFieldsToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :bad_jokes_told, :integer
    add_column :profiles, :dead_horses_beaten, :integer
  end
end
