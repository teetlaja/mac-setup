if [ -z "$AD_PASSWORD" ]; then
    echo "Checking $AD_PASSWORD"
    read -p "AD password for user `whoami`:" -s AD_PASSWORD;
    echo; # New line
fi
