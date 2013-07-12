class Factory

  def self.build(api)
    klass = Class.new(Object)
    klass.send(:include, Cut)
    klass.send(:url, api.url)
    klass.send(:selector, api.selector)
    api.mappings.each do |mapping|
      klass.send(:map, mapping.name, mapping.klass.constantize, to: mapping.selector)
    end
    klass
  end

end
