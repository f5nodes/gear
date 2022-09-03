#!/bin/bash
wget https://builds.gear.rs/gear-nightly-linux-x86_64.tar.xz
sudo tar -xvf gear-nightly-linux-x86_64.tar.xz -C /root
rm gear-nightly-linux-x86_64.tar.xz
$HOME/gear-node purge-chain -y
sudo systemctl restart gear
if [ "$language" = "uk" ]; then
    if [[ `service gear-node status | grep active` =~ "running" ]]; then
        echo -e "\n\e[93mGear Node Updated!\e[0m\n"
        echo -e "Подивитись логи ноди \e[92mjournalctl -n 100 -f -u gear\e[0m"
        echo -e "\e[92mCTRL + C\e[0m щоб вийти з логів\n"
        echo -e "Зробіть бекап \e[92m$HOME/.local/share/gear-node/chains/staging_testnet_v2/network\e[0m"
    else
        echo -e "\e[91mПомилка\e[39m під час оновлення Gear ноди."
    fi
else
    if [[ `service gear-node status | grep active` =~ "running" ]]; then
        echo -e "\n\e[93mGear Node Updated!\e[0m\n"
        echo -e "Check node logs \e[92mjournalctl -n 100 -f -u gear\e[0m"
        echo -e "\e[92mCTRL + C\e[0m to exit logs\n"
        echo -e "Backup \e[92m$HOME/.local/share/gear-node/chains/staging_testnet_v2/network\e[0m"
    else
        echo -e "\e[91mError\e[39m while updating Gear node."
    fi
fi