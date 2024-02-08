

rm -rf nvim
mkdir -p nvim
cd nvim

if [ -f /opt/nvim.appimage ]; then
    echo 'copy nvim.appimage'
    cp /opt/nvim.appimage .
else
    echo 'download nvim.appimage'
    wget https://github.com/neovim/neovim/releases/download/stable/nvim.appimage
    chmod +x nvim.appimage
fi

echo 'copy nvim config'
cp -r ~/.config/nvim/ .
echo 'copy nvim data'
cp -r ~/.local/share/nvim/ nvim_data

cd ..
zip -qr nvim.zip nvim/
rm -rf nvim



