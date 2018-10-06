#!/bin/bash

# you need permissions to read /var/log/syslog - usually be in adm group
# you need also ccze - for colorizing output
tail -f /var/log/syslog | ccze

