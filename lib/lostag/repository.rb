module Lostag
  module Repository
    extend self
    attr_reader :config

    def config
      @@config ||= Hashie::Mash.new
    end

    def configure
      yield(config)
    end

    def [](value)
      config[value]
    end
  end
end
