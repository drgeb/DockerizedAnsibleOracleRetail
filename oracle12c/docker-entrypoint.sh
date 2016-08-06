#!/usr/bin/env bash
rm -rf /var/run/sshd.pid /var/run/syslogd.pid

set -eo pipefail

rm -f /tmp/*.pid

# enable rsyslog daemon so that SSHD log file is created
rsyslogd

/etc/init.d/oradb start

# start SSH daemon
/usr/sbin/sshd -D

