class CreateLike2s < ActiveRecord::Migration
  def change
    create_table :like2s do |t|
      t.references :person, index: true, foreign_key: true
      t.references :secret2, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
