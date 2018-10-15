#!/bin/bash
S3CMD=/usr/bin/s3cmd
OPTIONS="-P --rr"
BUCKET=bucket
PREFIX=vod/
if [ -z "$1" ]; then
	echo Usage: ./move \<filename\>
	exit
fi
if $S3CMD $OPTIONS put "$1" s3://$BUCKET/$PREFIX; then
	rm -f "$1"
else
	echo Upload failed
fi
