#!/bin/bash

${HAPROXY_PID_FILE:=/opt/boxen/data/haproxy/haproxy.pid}
${HAPROXY_CFG_FILE:=/opt/boxen/config/haproxy/haproxy.cfg}

if [ -f $PID_FILE ]; then
    haproxy -f $HAPROXY_CFG_FILE -p $HAPROXY_PID_FILE -sf $(cat $HAPROXY_PID_FILE)
else
    haproxy -f $HAPROXY_CFG_FILE -p $HAPROXY_PID_FILE
fi