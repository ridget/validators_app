class AddPlotToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :plot, :text
  end
end
