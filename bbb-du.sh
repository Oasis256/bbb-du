#! /bin/bash

# Directories to show the sizes
declare -a dirs=(
	"/var/bigbluebutton/"
	"/var/bigbluebutton/published/presentation/"
	"/var/bigbluebutton/recording/raw/"
	"/var/bigbluebutton/recording/process/"
	"/var/freeswitch/meetings/"
	"/var/lib/red5/webapps/video/streams/"
	"/opt/freeswitch/log/"
	)

parameters="-s" # Default parameter for size

for par in "$@"
do
        case "$par" in
                -h|--human-readable) # Human readable dir size
                        parameters="$parameters -h" # du -h parameters for human readable output
                        ;;
                *)
                        echo "Wrong parameter \"$par\""
                        exit 1
                        ;;
        esac
done

for dir in "${dirs[@]}"
do
        du $parameters $dir
done
