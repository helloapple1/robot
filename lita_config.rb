Lita.configure do |config|
  # The name your robot will use.
  config.robot.name = "Lita"

  # The locale code for the language to use.
  # config.robot.locale = :en

  # The severity of messages to log. Options are:
  # :debug, :info, :warn, :error, :fatal
  # Messages at the selected level and above will be logged.
  #config.robot.log_level = :info
  config.robot.log_level = ENV.fetch('LOG_LEVEL', 'info').to_sym
  # An array of user IDs that are considered administrators. These users
  # the ability to add and remove other users from authorization groups.
  # What is considered a user ID will change depending on which adapter you use.
  # config.robot.admins = ["1", "2"]

  # The adapter you want to connect with. Make sure you've added the
  # appropriate gem to the Gemfile.
  #config.robot.adapter = :shell

  ## Example: Set options for the chosen adapter.
  # config.adapter.username = "myname"
  # config.adapter.password = "secret"

  ## Example: Set options for the Redis connection.
  # config.redis.host = "127.0.0.1"
  # config.redis.port = 1234

  ## Example: Set configuration for any loaded handlers. See the handler's
  ## documentation for options.
  # config.handlers.some_handler.some_config_key = "value"


#The adapter you want to connect whith.Make sure you've added the
#appropriate gem to the Gemfile.
#heroku uses a RACK_ENV of 'production' by default
if ENV['RACK_ENV']=='production'
  config.robot.adapter = :slack
  config.redis[:url]=ENV.fetch('REDIS_URL')
  #config.redis[:url]=ENV.fetch('redis://h:p3b0367716aca36ce25b1779241754684109aa4421e23845e1ad85c3f6d203b13@ec2-23-21-82-81.compute-1.amazonaws.com:11959')
else
  config.robot.adapter=:shell
end
#slack adapter demands a value even in dev when we aren't using it..
config.adapters.slack.token=ENV.fetch('SLACK_TOKEN','')


#config.robot.adapter = :slack
#config.adapters.slack.token = "xoxb-1447072035412-1434198094534-1490xwWbyJA89hOm0AA9j9wt"
#config.adapters.slack.token=ENV.fetch('xoxb-1447072035412-1434198094534-q9uq1SZko5yqBRGzhdTEYyh0','')
end