#!/bin/bash # – Simulate incoming transaction logs
# Simulates incoming transaction logs every 2 seconds

LOG_FILE="transaction.log"
> "$LOG_FILE"  # clear log file

TRANSACTIONS=(
    "TXN1001|SUCCESS"
    "TXN1002|FAILURE|Card Declined"
    "TXN1003|SUCCESS"
    "TXN1004|FAILURE|OTP Failed"
    "TXN1005|FAILURE|Bank Sync Error"
)

while true; do
    ENTRY=${TRANSACTIONS[$RANDOM % ${#TRANSACTIONS[@]}]}
    echo "$(date '+%Y-%m-%d %H:%M:%S')|$ENTRY" >> "$LOG_FILE"
    sleep 2
done
