SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

cd $SCRIPT_DIR

cp ./init.lua ../nixcats/init.lua
rm -rf ../nixcats/lua
cp -r ./lua ../nixcats/lua
