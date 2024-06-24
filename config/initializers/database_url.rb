# config/initializers/database_url.rb

require 'uri'
require 'active_record'

if ENV['DATABASE_POOL_URL']
  db_url = URI.parse(ENV['DATABASE_POOL_URL'])

  adapter = db_url.scheme
  username = db_url.user
  password = db_url.password
  host = db_url.host
  port = db_url.port
  database = db_url.path.sub(/^\//, '')

  ActiveRecord::Base.establish_connection(
    adapter: adapter,
    host: host,
    username: username,
    password: password,
    database: database,
    pool: ENV.fetch("DATABASE_POOL_SIZE") { 5 }
  )
end
