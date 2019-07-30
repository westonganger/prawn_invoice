module PrawnInvoice
  module Templates

    class BaseTemplate

      def initialize(data:)
        @data = data
      end

      def generate_pdf
        raise PrawnInvoice::Error.new("Must define a `generate_pdf` instance method on your custom template class")
      end

      def self.theme_name
        the_name = self.name.to_s.split("::").last

        underscored_name = the_name
          .gsub(/::/, '/')
          .gsub(/([A-Z]+)([A-Z][a-z])/,'\1_\2')
          .gsub(/([a-z\d])([A-Z])/,'\1_\2')
          .tr("-", "_")
          .downcase

        underscored_name
      end

    end

  end
end
