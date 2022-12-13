class PdfJob < ApplicationJob
  def perform(filename)
    pdf = Prawn::Document.new(page_size: "A4")
    PrawnHtml.append_html(
      pdf,
      '<h1 style="text-align: center">Just a test123</h1>'
    )
    pdf.render_file("public/'#{filename}.pdf'")
  end
end
