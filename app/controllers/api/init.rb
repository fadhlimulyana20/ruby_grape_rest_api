module Api
  class Init < Grape::API
    mount Api::Converter::Currency
    mount Api::Exportfile::Pdf
    mount Api::Job::Hello
  end
end
