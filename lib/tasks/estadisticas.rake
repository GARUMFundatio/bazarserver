
# estadisticas de los bazares

namespace :bazar do

 desc "Recolectando Información de los bazares"

 task :estadisticas => :environment do |t|
   
   for cluster in Cluster::all
     puts "cluster: #{cluster.nombre} - #{cluster.url}"

     # recojemos la información básica del bazar 
     
     uri = URI.parse("#{cluster.url}/api/info.json")

     post_body = []
     post_body << "Content-Type: text/plain\r\n"
  
       
     http = Net::HTTP.new(uri.host, uri.port)
     http.open_timeout = http.read_timeout = 10
       
     request = Net::HTTP::Get.new(uri.request_uri)
     request.body = post_body.join
     request["Content-Type"] = "text/plain"
     
     begin 
         
       res =  Net::HTTP.new(uri.host, uri.port).start {|http| http.request(request) }
       case res
       when Net::HTTPSuccess, Net::HTTPRedirection
         datos = JSON.parse(res.body)

         puts "#{datos.inspect} <-----------"
         
         # actualizamos la información del cluster 
         
         cluster.empresas = datos['empresas']
         cluster.save
         
         # actualizamos las estadísticas de este bazar
         
         bazar = Estadisticasbazar.where('bazar_id = ? and fecha = ?', cluster.id, DateTime.now.strftime("%Y-%m-%d") )
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
         puts "grabada la info en estadisticas"  
       else
         puts "ERROR en la petición a #{uri}---------->"+res.error!
       end       
       rescue Exception => e
         puts "Exception leyendo #{cluster.url} Got #{e.class}: #{e}"        
     end
       
   end 
 end


end
