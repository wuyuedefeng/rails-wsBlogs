worker_processes 2
timeout 30

APP_PATH = File.expand_path("../..", __FILE__)
working_directory APP_PATH

listen 8080, :tcp_nopush => true
listen "/tmp/unicorn.sock", :backlog => 64

stderr_path APP_PATH + "/log/unicorn.stderr.log"
stdout_path APP_PATH + "/log/unicorn.stderr.log"

pid APP_PATH + "/tmp/pids/unicorn.pid"