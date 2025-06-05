class Settings
  def initialize
    @config = {}
  end

  def add(name, value)
    @config[name] = value

    self.class.send(:define_method, name) do
      @config[name]
    end
  end

  def method_missing(method_name, *args)
    if @config.key?(method_name)
      @config[method_name]
    else
      "Configuração '#{method_name}' não existe"
    end
  end

  def respond_to_missing?(method_name, include_private = false)
    @config.key?(method_name)
  end
end

settings = Settings.new
settings.add(:timeout, 30)
settings.add(:mode, "production")

puts settings.timeout
puts settings.mode
puts settings.retry

puts settings.respond_to?(:timeout)
puts settings.respond_to?(:retry)