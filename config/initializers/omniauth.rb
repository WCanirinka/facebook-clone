OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['164536844826536'], ENV['092e30399db4eea2f69c17c36bf24711']
end
