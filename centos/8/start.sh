#!/bin/sh

/usr/local/bin/start-memcached &
/usr/local/bin/start-sogod &
/usr/local/bin/httpd-foreground
echo "Run Finished"
