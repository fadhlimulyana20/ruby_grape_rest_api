module Api
  module Exportfile
    class Pdf < Grape::API
      version "v1", using: :path
      format :json

      resource :pdf do
        post :generate do
          filename = Time.now.to_i
          ext = "pdf"
          loc = "public/#{filename}.pdf"
          asset = Asset.new(name: filename, ext: ext, loc: loc)
          asset.save

          puts asset

          PdfJob.perform_later(filename)
          present asset, with: Api::Exportfile::Entities::AssetEntity
        end

        route_param :id do
          get do
            asset = Asset.find(params[:id])
            header["Content-Disposition"] = "attachment; filename=test.pdf"
            content_type "application/pdf"
            env["api.format"] = :binary

            File.binread(asset.loc)
          end
        end
      end
    end
  end
end
