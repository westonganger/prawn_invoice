module PrawnRails
  module Templates
    
    def self.classes
      ObjectSpace.each_object(Class).select{|klass| 
        klass < PrawnInvoice::Templates::BaseTemplate 
      }.sort_by{|x| x.name}
    end

    def self.from_name(name)
      name = name.to_s

      self.classes.each do |klass|
        if klass.template_name == name
          return klass
        end
      end

      raise PrawnInvoice::Error.new("PrawnInvoice template `#{name}` was not found")
    end

  end
end
