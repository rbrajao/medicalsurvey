class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.references :survey, null: false, foreign_key: true
      t.references :organization, null: false, foreign_key: true
      t.string :name
      t.datetime :date_init
      t.datetime :date_end
      t.string :acessurl
      t.boolean :status

      t.timestamps
    end
  end
end
