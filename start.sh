#!/bin/bash
echo '/tmp/core.%h.%e.%t' > /proc/sys/kernel/core_pattern
ulimit -c unlimited
/src/server 4000
