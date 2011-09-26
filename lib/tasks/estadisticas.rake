
# estadisticas de los bazares

require "net/http"
require "uri"
require "typhoeus"
 
namespace :bazar do

 desc "Recolectando Información de los bazares"

 task :estadisticas => :environment do |t|
   
   
   puts "(a) actualizamos la información de los clusters"
   puts "-----------------------------------------------"

   for cluster in Cluster::all


     puts "\n\ncluster: #{cluster.nombre} - #{cluster.url}"
     puts "----------------------------------------------\n\n"

     hydra = Typhoeus::Hydra.new
     # recojemos la información básica del bazar 
     
     uri = "#{cluster.url}/api/info.json"
     datos = ""
         
       r = Typhoeus::Request.new(uri, :timeout => 10000)
       
       r.on_complete do |res|
         puts "-------------> "+res.inspect
         case res.curl_return_code
         when 0
       
           begin
           datos = JSON.parse(res.body)

           rescue 
              puts "No se ha podido interpretar el json"
           else

           puts "#{datos.inspect} <-----------"
         
           # actualizamos la información del cluster 
         
	   puts "---------> Actualizamos el número de Empresas"
           cluster.empresas = datos['empresas']
	   puts "Empresas del cluster #{cluster.nombre}: #{cluster.empresas}"
           cluster.save
         
          end
      end
     end
     
     hydra.queue r 
     # actualizamos las estadísticas de este bazar
     puts "actualizamos las estadisticas"

     bazar = Estadisticasbazar.find_by_bazar_id_and_fecha(cluster.id, DateTime.now.strftime("%Y-%m-%d"))
     puts "bazar #{bazar.inspect}"
     if (bazar.nil?)
       puts "No existe lo creo"
       bazar = Estadisticasbazar.new
       bazar.fecha = DateTime.now.strftime("%Y-%m-%d")
       bazar.bazar_id = cluster.id
     end 
     
     bazar.empresas = datos['empresas']
     bazar.consultas = datos['consultas']
     bazar.clustersactivos = datos['clustersactivos']
     
     bazar.save

     # por cada uno de los bazares obtenemos la lista de empresas. 

     uri = "#{cluster.url}/api/empresas.json"

     datos = ""
         
       r = Typhoeus::Request.new(uri, :timeout => 5000)

       r.on_complete do |response|
         puts "-------------> "+response.inspect
         case response.curl_return_code
         when 0
           begin
             datos = JSON.parse(resonse.body)
            rescue 
              puts "----------> error en los datos:"
              puts response.body.inspect
           
            else    
               puts "#{datos.inspect} <----------- datos empresas"
         
               for dat in datos 
                  empresa = Estadisticasempresa.find_by_bazar_id_and_empresa_id(cluster.id, dat['id'])
                  puts "empresa #{empresa.inspect}"
                  if (empresa.nil?)
                    puts "No existe lo creo"
                    empresa = Estadisticasempresa.new
                    empresa.empresa_id = dat['id']
                    empresa.bazar_id = cluster.id
                  end 

                  empresa.fundada = dat['fundada']
                  empresa.consultas = dat['consultas']
                  empresa.nombre = dat['nombre']
                  empresa.url = dat['url']

                  empresa.save
                end # for datos
              end # exception              
          end # when
      
        end #complete
    hydra.queue r 
    hydra.run
    end # for   
end # task

end # namespace 
