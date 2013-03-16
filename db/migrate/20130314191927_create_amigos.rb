class CreateAmigos < ActiveRecord::Migration
  def change
    create_table :amigos do |t|
      t.integer :user_id
      t.integer :amigo_id
      t.string :estado

      t.timestamps
    end
  end
end
