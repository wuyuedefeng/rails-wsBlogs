worker_processes 2

preload_app true

timeout 60

APP_PATH = File.expand_path("../..", __FILE__)
working_directory APP_PATH

listen 8080, :tcp_nopush => true
listen APP_PATH+"/tmp/unicorn.sock", :backlog => 64
pid    APP_PATH+"/tmp/pids/unicorn.pid"


stderr_path APP_PATH + "/log/unicorn.stderr.log"
stdout_path APP_PATH + "/log/unicorn.stderr.log"


pid APP_PATH + "/tmp/pids/unicorn.pid"

before_fork do |server, worker|
# This option works in together with preload_app true setting
# What is does is prevent the master process from holding
# the database connection
  defined?(ActiveRecord::Base) and
    ActiveRecord::Base.connection.disconnect!
end
 
after_fork do |server, worker|
# Here we are establishing the connection after forking worker
# processes
  defined?(ActiveRecord::Base) and
    ActiveRecord::Base.establish_connection
end