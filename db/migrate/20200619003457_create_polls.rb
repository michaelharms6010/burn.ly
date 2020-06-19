class CreatePolls < ActiveRecord::Migration[6.0]
  def change
    create_table :polls do |t|
      t.references :user, null: false, foreign_key: true
      t.text :question
      t.text :options
      t.string :taddr

      t.timestamps
    end
  end
end
