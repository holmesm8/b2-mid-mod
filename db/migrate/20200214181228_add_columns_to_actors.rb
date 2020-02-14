class AddColumnsToActors < ActiveRecord::Migration[5.1]
  def change
    add_column :actors, :age, :string
  end
end
