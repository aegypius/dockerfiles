[supervisord]
nodaemon  = true
user      = root
loglevel  = {{ default .Env.SUPERVISOR_LOG_LEVEL "INFO" }}

[unix_http_server]
file=/var/run/supervisor.sock
chmod=0700

[rpcinterface:supervisor]
supervisor.rpcinterface_factory = supervisor.rpcinterface:make_main_rpcinterface

[supervisorctl]
serverurl=unix:///var/run/supervisor.sock

[program:sickrage]
command = python -u SickBeard.py --datadir={{ default .Env.SB_DATA "/data" }} --config={{ default .Env.SB_DATA "/data" }}/config.ini
directory               = {{ default .Env.SB_HOME "/sickrage" }}
autostart               = true
autorestart             = unexpected
stopsignal              = TERM
stopasgroup             = true
stopwaitsecs            = 10
stdout_logfile          = /dev/stderr
stdout_logfile_maxbytes = 0
stderr_logfile          = /dev/stderr
stderr_logfile_maxbytes = 0

[program:updater]
command                 = python -u /usr/local/bin/updater -a sickrage -b {{ default .Env.SICKRAGE_CHANNEL "master" }} -f {{ default .Env.UPDATE_FREQUENCY "28800" }}
stdout_logfile          = /dev/stderr
stdout_logfile_maxbytes = 0
stderr_logfile          = /dev/stderr
stderr_logfile_maxbytes = 0
