class Factory

  def self.build(api)
    klass = Class.new(Klass)
    klass.send(:include, Cut)
    klass.send(:url, api.url)
    klass.send(:selector, api.selector)
    api.mappings.each do |mapping|
      klass.send(:map, mapping.name, String, to: mapping.selector)
    end
    klass
  end

end
