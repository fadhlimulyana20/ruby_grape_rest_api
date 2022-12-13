module Api
  class Init < Grape::API
    mount Api::Converter::Currency
    mount Api::Exportfile::Pdf
  end
end
