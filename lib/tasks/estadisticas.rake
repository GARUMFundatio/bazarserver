
# estadisticas de los bazares

namespace :bazar do

 desc "Recolectando Información de los bazares"

 task :estadisticas => :environment do |t|
   
   for cluster in Cluster::all
     puts "cluster: #{cluster.nombre} - #{cluster.url}"
   end 
 end


end
