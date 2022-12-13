module Api
  module Exportfile
    class Pdf < Grape::API
      version "v1", using: :path

      resource :pdf do
        get :export do
          header["Content-Disposition"] = "attachment; filename=test.pdf"
          content_type "application/pdf"
          env["api.format"] = :binary

          pdf = Prawn::Document.new(page_size: "A4")
          PrawnHtml.append_html(
            pdf,
            '<h1 style="text-align: center">Just a test</h1>'
          )
          pdf.render_file("public/test.pdf")
          File.binread("public/test.pdf")
        end
      end
    end
  end
end