class ApplicationController < ActionController::Base
  # XXX ATENCION: Debe preocuparse en el controlador de colocar los breadcrumbs, en cada uno de sus metodos
  before_action :set_empty_breadcrumbs

  private
  def set_empty_breadcrumbs
    @breadcrumbs = []
  end
end
