if defined?(ActionController)
  ActionController::Renderers.add(:pdf) do |pdf_data, options|
    options[:filename] = options[:filename] ? options[:filename].strip.sub(/\.#{format}$/i,'') : 'invoice'

    options[:filename] += ".#{format}"
      
    send_data pdf_data, type: :pdf, disposition: :attachment, filename: options[:filename]
  end
end
