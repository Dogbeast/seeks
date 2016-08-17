class CreateSecret2s < ActiveRecord::Migration
  def change
    create_table :secret2s do |t|
      t.text :content
      t.references :person, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
