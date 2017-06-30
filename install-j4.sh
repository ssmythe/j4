if [[ $(whoami) != "root" ]]; then
    echo "Must be run as root"
    exit 1
fi

curl -sSL https://raw.githubusercontent.com/ssmythe/j4/master/j4 > /usr/local/bin/j4
chmod +x /usr/local/bin/j4

echo "j4 installed"
