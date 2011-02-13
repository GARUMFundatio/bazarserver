class CreateEstadisticasconsultas < ActiveRecord::Migration
  def self.up
    create_table :estadisticasconsultas do |t|
      t.datetime :fecha
      t.integer :bazar_id
      t.string :consulta

      t.timestamps
    end
  end

  def self.down
    drop_table :estadisticasconsultas
  end
end
