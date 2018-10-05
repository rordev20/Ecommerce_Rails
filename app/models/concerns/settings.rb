module Settings
  extend ActiveSupport::Concern
  def get_settings_yml_data
    YAML.load_file('config/settings.yml')[Rails.env] rescue {}
  end
end