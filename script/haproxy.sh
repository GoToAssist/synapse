#!/bin/bash

case "$1" in
    'start')
        haproxy -f /opt/boxen/homebrew/etc/haproxy/haproxy.cfg -p /opt/boxen/homebrew/var/run/haproxy.pid
    ;;
    'reload')
        haproxy -f /opt/boxen/homebrew/etc/haproxy/haproxy.cfg -p /opt/boxen/homebrew/var/run/haproxy.pid -sf $(cat /opt/boxen/homebrew/var/run/haproxy.pid)
    ;;
esac