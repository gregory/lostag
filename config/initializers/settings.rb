module VoxiPay
  class Settings < Settingslogic
    source "#{File.join('config', 'settings', 'endpoints.yml')}"
    namespace RACK_ENV
  end
end
