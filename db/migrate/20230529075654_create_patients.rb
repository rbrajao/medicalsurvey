class CreatePatients < ActiveRecord::Migration[7.0]
  def change
    create_table :patients do |t|
      t.references :user, null: false, foreign_key: true
      t.references :event, null: false, foreign_key: true
      t.string :name
      t.date :birthday
      t.string :cpf
      t.boolean :status

      t.timestamps
    end
  end
end
