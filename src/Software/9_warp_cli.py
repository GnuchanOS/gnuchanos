# it's nice joke in turkey

sudo systemd-resolve --flush-caches
yay -S cloudflare-warp-bin
sudo systemctl start warp-svc
sudo systemctl enable warp-svc
warp-cli  registration new
warp-cli mode warp+doh 
warp-cli  dns families off 
warp-cli connect
warp-cli status