class CreateEstadisticasempresas < ActiveRecord::Migration
  def self.up
    create_table :estadisticasempresas do |t|
      t.integer :empresa_id
      t.integer :bazar_id
      t.integer :consultas
      t.integer :fundada

      t.timestamps
    end
    add_index "estadisticasempresas", ["bazar_id","empresa_id"], :name => "index_estaempre_bazar"
  end

  def self.down
    drop_table :estadisticasempresas
  end
end
