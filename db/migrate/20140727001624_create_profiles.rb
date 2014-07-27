class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.integer :bay_films_watched
      t.string :megan_foxs_acting_ability
      t.integer :user_id
      t.string :great_bay_films
      t.timestamps
    end
  end
end
