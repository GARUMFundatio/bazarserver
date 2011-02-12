class CreateEstadisticasbazares < ActiveRecord::Migration
  def self.up
    create_table :estadisticasbazares do |t|
      t.date :fecha
      t.integer :bazar_id
      t.integer :empresas
      t.integer :consultas
      t.integer :clustersactivos

      t.timestamps
    end
    add_index "estadisticasbazares", ["fecha","bazar_id"], :name => "index_estabazar_fecha"
    add_index "estadisticasbazares", ["bazar_id","fecha"], :name => "index_estabazar_bazar"
  end

  def self.down
    drop_table :estadisticasbazares
  end
end
