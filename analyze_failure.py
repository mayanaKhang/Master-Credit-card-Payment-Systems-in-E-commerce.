import sys

def categorize_issue(log_line):
    parts = log_line.strip().split('|')
    if len(parts) < 4:
        return "Unclassified failure"

    reason = parts[3].lower()
    if "otp" in reason:
        return "OTP Failure"
    elif "declined" in reason:
        return "Card Declined"
    elif "sync" in reason:
        return "Bank Sync Error"
    else:
        return "Unknown Issue"

if __name__ == "__main__":
    log_line = sys.stdin.read()
    category = categorize_issue(log_line)
    print(f"🛠 Issue categorized as: {category}")
