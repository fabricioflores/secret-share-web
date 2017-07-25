class CreateSecrets < ActiveRecord::Migration[5.0]
  def change
    create_table :secrets do |t|
      t.string :description
      t.integer :available
      t.integer :needed
      t.text :splits, array: true, default: []

      t.timestamps
    end
  end
end
