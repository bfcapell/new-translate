require 'ya2yaml'
require 'i18n_translate_backend'

module Translate
  class Engine < Rails::Engine
    isolate_namespace Translate

    I18n::Backend::Simple.send(:include, I18n::Backend::I18nTranslateBackend)

    config.after_initialize do
      Translate::Storage.mode = if defined?(Ubiquo::Settings) && Ubiquo::Settings.option_exists?(:translate_mode)
        Ubiquo::Settings[:translate_mode]
      else
        :application
      end

      def I18n.supported_locales
        if defined?(Ubiquo::Settings) && Ubiquo::Settings.option_exists?(:supported_locales)
          Ubiquo::Settings[:supported_locales]
        else
          I18n.available_locales
        end
      end
    end

  end if defined?(Rails) && Rails::VERSION::MAJOR >= 3

  class << self
    # For configuring Google Translate API key
    attr_accessor :api_key
    # For configuring Bing Application id
    attr_accessor :app_id
  end

end

Dir[File.join(File.dirname(__FILE__), "translate", "*.rb")].each do |file|
  require file
end
