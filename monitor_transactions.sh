#!/bin/bash

LOG_FILE="transaction.log"

echo "Monitoring transactions in real time..."
tail -Fn0 "$LOG_FILE" | \
while read -r line; do
    echo "$line" | grep "FAILURE" > /dev/null
    if [ $? = 0 ]; then
        echo "⚠️  Detected failure: $line"
        echo "$line" | python3 analyze_failure.py
    fi
done
