worker_processes 4
timeout 30

APP_PATH = File.expand_path("../..", __FILE__)
working_directory APP_PATH

listen 8080, :tcp_nopush => true
listen "/tmp/unicorn.sock", :backlog => 64

timeout 30

stderr_path APP_PATH + "/log/unicorn.stderr.log"
stdout_path APP_PATH + "/log/unicorn.stderr.log"

pid APP_PATH + "/tmp/pids/unicorn.pid"

check_client_connection false

run_once = true
if run_once
    # do_something_once_here ...
    run_once = false # prevent from firing again
  end