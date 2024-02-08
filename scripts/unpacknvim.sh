set -e
if [ ! -f nvim.zip ];then
    echo 'nvim.zip not found'
fi
rm -rf /tmp/nvim
unzip nvim.zip -d /tmp/
cd /tmp/nvim

rm -rf ~/.config/nvim
rm -rf ~/.local/share/nvim
mkdir -p ~/.config/
mkdir -p ~/.local/share/

mv nvim ~/.config/nvim
mv nvim_data ~/.local/share/nvim


nvim_dir=/opt/nvim
rm -rf $nvim_dir
mkdir -p $nvim_dir
cp nvim.appimage $nvim_dir/nvim.appimage
cd $nvim_dir
chmod +x nvim.appimage
./nvim.appimage --appimage-extract
ln -s $(pwd)/squashfs-root/AppRun /usr/bin/nv

