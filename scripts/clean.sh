read -p "[?] Are you sure you want to remove all Vault's data (y/n)? " answer
case ${answer:0:1} in
    y|Y )
        echo "[*] Removing files..."
        echo "[+] Removing: ./dhv/consul/"
        rm -rf ./dhv/consul/
        echo "[+] Removing: ./dhv/backup/"
        rm -rf ./dhv/backup/
        echo "[+] Removing: ./dhv/keys.txt"
        rm -f ./dhv/keys.txt
    ;;
    * )
        echo "[*] Aborting..."
    ;;
esac
