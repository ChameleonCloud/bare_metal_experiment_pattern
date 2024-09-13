#!/usr/bin/env bash

task_time_s="${1:-30}"
num_cores=$(nproc)

echo "Task time: ${task_time_s}s"
echo "Number of cores: ${num_cores}"

echo "Cleaning output directory ..."
rm -rf ./out && mkdir ./out

output="./out/run-$(date +%Y%m%d.%H%M.%S).out"

run_task() {
  sudo perf stat -e power/energy-pkg/,power/energy-ram/ "$@"
}

echo
echo "************************"
echo "** Running at 25% ... **"
echo "************************"

run_task stress-ng --cpu $((num_cores/4)) --timeout "$task_time_s"s 2>&1 | grep -P -o '[\d\.]+.Joules.+' | cut -d ' ' -f 1,3 | sed -e "s/.*/25 &/" >> "$output"

echo
echo "************************"
echo "** Running at 50% ... **"
echo "************************"

run_task stress-ng --cpu $((num_cores/2)) --timeout "$task_time_s"s 2>&1 | grep -P -o '[\d\.]+.Joules.+' | cut -d ' ' -f 1,3  | sed -e "s/.*/50 &/" >> "$output"

echo
echo "************************"
echo "** Running at 100% .. **"
echo "************************"

run_task stress-ng --cpu $num_cores --timeout "$task_time_s"s 2>&1 | grep -P -o '[\d\.]+.Joules.+' | cut -d ' ' -f 1,3 | sed -e "s/.*/100 &/" >> "$output"

# This file is loaded automatically onto nodes
source ~/openrc

today=$(date '+%Y-%m-%d')
bucket_name="bare_metal_experiment_pattern_data_$today"

echo
echo "Uploading results to the object store container $bucket_name"
# Create the bucket if it doesn't exist
swift post $bucket_name

for file in ./out/*; do
	echo "Uploading $file"
	swift upload $bucket_name $file --object-name $(basename $file)
done

