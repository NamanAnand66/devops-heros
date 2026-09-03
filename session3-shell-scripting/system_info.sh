==========================================================================

echo "=========================================="
echo "      SYSTEM INFORMATION REPORT          "
echo "=========================================="

# 1. Store and display Current Date
CURRENT_DATE=$(date)
echo "[+] Current Date and Time: $CURRENT_DATE"

# 2. Store and display Hostname
SYS_HOSTNAME=$(hostname)
echo "[+] System Hostname: $SYS_HOSTNAME"

# 3. Store and display Current Username
SYS_USER=$(whoami)
echo "[+] Current User: $SYS_USER"

echo ""
echo "=========================================="
echo "          DISK USAGE SUMMARY              "
echo "=========================================="
# 4. Display Disk Usage
df -h

echo ""
echo "=========================================="
echo "          USER INPUT & LOG FILE           "
echo "=========================================="

# 5. Take User Input using read -p
read -p "Enter your Name: " USER_NAME
read -p "Enter your Roll Number / ID: " ROLL_NO
read -p "Enter a Comment or Note: " USER_COMMENT

echo ""
echo "--> User Information Collected:"
echo "    Name        : $USER_NAME"
echo "    Roll Number : $ROLL_NO"
echo "    Comment     : $USER_COMMENT"

# 6. Create Directory using mkdir
TARGET_DIR="system_logs"
mkdir -p "$TARGET_DIR"
echo "[+] Output directory '$TARGET_DIR' created/verified."

# 7. Create File using touch
LOG_FILE="$TARGET_DIR/process.log"
touch "$LOG_FILE"
echo "[+] Log file '$LOG_FILE' created."

# 8. Store Running Processes into process.log using > output redirection
ps aux > "$LOG_FILE"
echo "[+] Running process snapshot saved to '$LOG_FILE' using redirection (>)."

echo ""
echo "[+] System Info Script execution completed successfully!"
