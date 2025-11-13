#!/bin/bash

echo "======================================"
echo "        SERVER PERFORMANCE STATS       "
echo "======================================"

echo ""
echo "1. CPU Usage:"
top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8"% used"}'

echo ""
echo "2. Memory Usage:"
free -h | awk 'NR==2{printf "Used: %s / Total: %s (%.2f%%)\n", $3, $2, $3*100/$2 }'

echo ""
echo "3. Disk Usage:"
df -h / | awk 'NR==2{printf "Used: %s / Total: %s (%s)\n", $3, $2, $5 }'

echo ""
echo "4. Top 5 Processes by CPU:"
ps -eo pid,comm,%cpu --sort=-%cpu | head -n 6

echo ""
echo "5. Top 5 Processes by Memory:"
ps -eo pid,comm,%mem --sort=-%mem | head -n 6

echo ""
echo "======================================"
echo "        END OF SERVER REPORT"
echo "======================================"
