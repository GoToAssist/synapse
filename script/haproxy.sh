#!/bin/bash

PID_FILE=/opt/boxen/data/haproxy/haproxy.pid
CFG_FILE=/opt/boxen/config/haproxy/haproxy.cfg

if [ -f $PID_FILE ]; then
    haproxy -f $CFG_FILE -p $PID_FILE -sf $(cat $PID_FILE)
else
    haproxy -f $CFG_FILE -p $PID_FILE
fi