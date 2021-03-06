#!/usr/bin/env bash
set -eo pipefail
rm -rf /var/run/sshd.pid /var/run/syslogd.pid

rm -f /tmp/*.pid

# enable rsyslog daemon so that SSHD log file is created
rsyslogd

# start SSH daemon
/usr/sbin/sshd -D
