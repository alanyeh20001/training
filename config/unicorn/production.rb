listen "/home/apps/training/shared/tmp/unicorn.sock"

worker_processes 2 # this should be >= nr_cpus

pid "/home/apps/training/shared/tmp/pids/unicorn.pid"

stderr_path "log/unicorn.stderr.log"
stdout_path "log/unicorn.stdout.log"
