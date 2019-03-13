#!/bin/bash - 
#=============================================================================
#
#          FILE: install_proton_vpn.sh
# 
#         USAGE: ./install_proton_vpn.sh 
# 
#   DESCRIPTION: Install and setup ProtonVPN on Debian-based Linux systems.
# 
#       OPTIONS: ---
#  REQUIREMENTS: Distro must use package-managers `apt` and `apt-get`.
#=============================================================================

set -o nounset     # Treat unset variables as an error

echo "Installing ProtonVPN files..."
echo
echo "This script will fail if you aren't logged in to account.protonvpn.com"
echo "Now would be a good time to check that you are."
echo "If you'd like to log in first, press <Ctrl+C> now."
sleep 5

PACKAGE_MANAGER=$(which apt-get)
CONFIG_DOWNLOAD_URL="https://account.protonvpn.com/api/vpn/config?APIVersion=3&Country=US&LogicalID=KEqFFCXoMA3aA8KpzMxM6jzP7iZocmg88Loof5tZKAAV9TWboBgn-0Iu9hPC4s2DTRtX9EOq4Et3QYTsHKvvTA%3D%3D&Platform=Linux&Protocol=tcp"

echo "Installing openvpn CLI and GUI tools..."
sudo "${PACKAGE_MANAGER}" install -y openvpn
sudo "${PACKAGE_MANAGER}" install -y network-manager-openvpn-gnome
sudo "${PACKAGE_MANAGER}" install -y resolvconf

echo "Downloading ProtonVPN config files for openvpn..."
mkdir -p ~/Downloads/openvpn_confs
curl "$CONFIG_DOWNLOAD_URL" > ~/Downloads/openvpn_confs/us_openvpn_config.ovpn
cd ~/Downloads/openvpn_confs/

echo "Opening a VPN connection with openvpn..."
sudo openvpn us_openvpn_config.ovpn
