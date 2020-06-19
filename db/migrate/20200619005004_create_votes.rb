class CreateVotes < ActiveRecord::Migration[6.0]
  def change
    create_table :votes do |t|
      t.references :poll, null: false, foreign_key: true
      t.string :option
      t.decimal :amount, precision: 13, scale: 8

      t.timestamps
    end
  end
end
