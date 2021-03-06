class GenerateInvoicePdfGrover

  MAIN_LAYOUT = 'layouts/pdf/main'
  MAIN_TEMPLATE = 'pdf/invoice'

  def call(file_path: Rails.root.join('tmp', 'pdf-invoice-grover.pdf'))
    document_html = build_pdf
    
    document_html = Grover::HTMLPreprocessor.process document_html, 'http://localhost:3000/', 'http'

    grover_options = {
      format: 'A4',
      margin: { top: '0.5in', bottom: '0.5in', left: '0.5in', right: '0.5in'},
    }
    pdf_bytestream = Grover.new(document_html, grover_options).to_pdf
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