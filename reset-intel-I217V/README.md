# systemd activation

```
chmod +x ./reset-intel-I217V.sh
ln -s `pwd -P`/reset-intel-I217V.service  /usr/lib/systemd/system/
systemctl daemon-reload
systemctl enable reset-intel-I217V.service
```
