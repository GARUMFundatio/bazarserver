class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :BZ_param
  
  def BZ_param(clave)
    conf = Conf.find_by_nombre(clave)
    return conf.valor || nil   
  end
  
end
