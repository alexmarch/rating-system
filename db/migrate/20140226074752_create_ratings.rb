class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.decimal :vote
      t.float :vote_average
      t.string :ip
      t.references :movie, index: true

      t.timestamps
    end
  end
end
