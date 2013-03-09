class CreatePerfiles < ActiveRecord::Migration
  def change
    create_table :perfiles do |t|
      t.integer :user_id
      t.string :nombre
      t.string :apellidos
      t.string :sexo
      t.date :fecha_nacimiento
      t.string :ciudad
      t.timestamps
    end
  end
end
