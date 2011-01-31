xml.instruct! :xml, :version => "1.0" 
xml.rss :version => "2.0" do
  xml.channel do
    xml.title BZ_param("Titular")+": Noticias"
    xml.description BZ_param("Subtitular")
    xml.link "directorio.garumfundatio.org"

    for noticia in @noticias
      xml.item do
        xml.title noticia.titulo
        xml.description noticia.texto
        xml.pubDate noticia.fecha.to_s(:rfc822)
        xml.link "directorio.garumfundatio.org"
        xml.guid "directorio.garumfundatio.org"
      end
    end
  end
end