require 'pony'
config_file = YAML::load_file(File.expand_path(File.join(File.dirname(__FILE__), '..', 'settings', 'pony.yml')))
config = config_file[RACK_ENV]
Pony.options= {
  from: 'no-reply@lostag.gregory.io',
  via: :smtp,
  via_options: {
    address: config['address'],
    port: config['port'],
    domain: config['domain'],
    user_name: config['user_name'],
    password: config['password'],
    authentication: config['authentication'],
    enable_starttls_auto: config['enable_starttls_auto']
  }
}
