class CreateOrganizations < ActiveRecord::Migration[7.0]
  def change
    create_table :organizations do |t|
      t.string :name
      t.string :fantasyname
      t.string :cnpj
      t.boolean :status

      t.timestamps
    end
  end
end
