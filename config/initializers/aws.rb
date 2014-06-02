require 'aws-sdk'

Rails.configuration.aws = YAML.load(ERB.new(File.read(Rails.root.join('config', 's3.yml'))).result)[Rails.env].symbolize_keys!
AWS.config(logger: Rails.logger)
AWS.config(Rails.configuration.aws)
