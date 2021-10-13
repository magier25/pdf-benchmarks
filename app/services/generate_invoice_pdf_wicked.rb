class GenerateInvoicePdfWicked

  MAIN_LAYOUT = 'layouts/pdf/main'
  MAIN_TEMPLATE = 'pdf/invoice'

  def call(file_path: Rails.root.join('tmp', 'pdf-invoice-wicked.pdf'))
    document_html = build_pdf
    #document_html = Grover::HTMLPreprocessor.process document_html, 'http://localhost:3000/', 'http'

    pdf_bytestream = WickedPdf.new.pdf_from_string(document_html)
    File.open(file_path, 'wb') { |f| f.write(pdf_bytestream) } if file_path.present?
    pdf_bytestream
  end

  private

  def build_pdf
    PdfRenderingController.new.render_to_string(
      template: MAIN_TEMPLATE,
      layout: MAIN_LAYOUT,
      locals: { }
    )
  end

end