#!/usr/bin/env bash
echo "################################################"
echo "Setting Up Docker..."
echo "################################################"
brctl addbr cfy0
ip addr add 172.20.0.1/24 dev cfy0
ip link set dev cfy0 up

echo "################################################"
echo "Playing around with SystemD for Ubuntu/Docker Upgrade..."
echo "################################################"

sed -i 's/ExecStart.*/ExecStart\=\/usr\/bin\/dockerd/g' /lib/systemd/system/docker.service
cat > /etc/docker/daemon.json <<EOL
{
    "bridge": "cfy0",
    "dns": ["8.8.8.8", "8.8.8.4"],
    "hosts": ["unix:///var/run/docker.sock", "tcp://172.20.0.1:2375"],
    "mtu": 1420
}
EOL

systemctl daemon-reload
systemctl restart docker.service
echo "################################################"
echo "Done"
echo "################################################"
