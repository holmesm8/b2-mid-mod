class CreateActormovies < ActiveRecord::Migration[5.1]
  def change
    create_table :actormovies do |t|
      t.references :actor, foreign_key: true
      t.references :movie, foreign_key: true
    end
  end
end
