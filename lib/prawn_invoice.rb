require "prawn"

require "prawn_invoice/version"
require "prawn_invoice/errors"
require "prawn_invoice/mime"
require "prawn_invoice/action_controller_renderer"

require "prawn_invoice/templates"
require "prawn_invoice/templates/base_template"
require "prawn_invoice/templates/default"

module PrawnInvoice

  def self.to_pdf(data:, template: PrawnInvoice::Templates::Default)
    if template.is_a?(PrawnInvoice::Templates::BaseTemplate)
      @template = template
    else
      @template = PrawnInvoice::Templates.from_name(template.to_s).new
    end

    validate_schema(template: template, data: data)

    template.generate_pdf.render
  end

  def self.to_pdf_file(filename:, data:, template: PrawnInvoice::Templates::Default)
    File.open(filename, "wb") do |f|
      f.write self.to_pdf(data: data, template: template)
    end
  end

  private

  def self.validate_schema(template:, data:)
    template.schema.each_with_index do |schema_entry, i|
      if !validate_entry(schema_entry, data[i])
        raise PrawnInvoice::Error
      end
    end

    return true
  end

  def self.validate_entry(schema_entry, data_entry)
    [Hash, Array].each do |type|
      if schema_entry.is_a?(type) != data_entry.is_a?(type)
        return false
      end
    end

    if schema_entry.is_a?(Hash)
      if !validate_hash(schema_entry, data_entry)
        return false
      end
    elsif schema_entry.is_a?(Array) && data_entry[0]
      if schema_entry[0].is_a?(Hash) && !validate_hash(schema[0], data_entry[0])
        return false
      end
    end

    return true
  end

  def self.validate_hash(schema_hash, data_entry)
    if !(schema_hash.keys - data_entry.keys).empty?
      return false
    else
      schema_entry.each_with_index do |schema_item, i|
        unless validate_entry.call(schema_item, data_entry[i])
          return false
        end
      end
    end

    return true
  end

end
