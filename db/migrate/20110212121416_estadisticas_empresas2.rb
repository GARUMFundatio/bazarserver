class EstadisticasEmpresas2 < ActiveRecord::Migration
  def self.up
   add_column :estadisticasempresas, :url, :string
   add_column :estadisticasempresas, :nombre, :string
  end

  def self.down
  end
end
