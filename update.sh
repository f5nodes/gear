#!/bin/bash
sudo systemctl stop gear
$HOME/gear purge-chain -y
rm -rvf /root/.local/share/gear-node/chains/gear_staging_testnet_v3/db
wget https://get.gear.rs/gear-nightly-linux-x86_64.tar.xz
sudo tar -xvf gear-nightly-linux-x86_64.tar.xz -C /root
rm gear-nightly-linux-x86_64.tar.xz
sudo systemctl start gear
sleep 2
sudo systemctl stop gear
cd $HOME/.local/share/gear/chains
mkdir -p gear_stable_testnet/network/ gear_staging_testnet_v4/network/
sudo cp gear_staging_testnet_v3/network/secret_ed25519 gear_staging_testnet_v4/network/secret_ed25519
sudo cp gear_staging_testnet_v4/network/secret_ed25519 gear_stable_testnet/network/secret_ed25519
sudo systemctl start gear
if [ "$language" = "uk" ]; then
    if [[ `service gear status | grep active` =~ "running" ]]; then
        echo -e "\n\e[93mGear Node Updated!\e[0m\n"
        echo -e "Подивитись логи ноди \e[92mjournalctl -n 100 -f -u gear\e[0m"
        echo -e "\e[92mCTRL + C\e[0m щоб вийти з логів\n"
        echo -e "Зробіть бекап \e[92m$HOME/.local/share/gear/chains/gear_stable_testnet/network\e[0m"
    else
        echo -e "\e[91mПомилка\e[39m під час оновлення Gear ноди."
    fi
else
    if [[ `service gear status | grep active` =~ "running" ]]; then
        echo -e "\n\e[93mGear Node Updated!\e[0m\n"
        echo -e "Check node logs \e[92mjournalctl -n 100 -f -u gear\e[0m"
        echo -e "\e[92mCTRL + C\e[0m to exit logs\n"
        echo -e "Backup \e[92m$HOME/.local/share/gear/chains/gear_stable_testnet/network\e[0m"
    else
        echo -e "\e[91mError\e[39m while updating Gear node."
    fi
fi