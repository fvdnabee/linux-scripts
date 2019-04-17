Mark all scripts executable:
`chmod +x *.sh`

Symlink scripts under /usr/lib/systemd/system-sleep/:
```ln -s `pwd -P`/restart-fancontrol-after-resume.sh  /usr/lib/systemd/system-sleep/
ln -s `pwd -P`/rtcwake.sh  /usr/lib/systemd/system-sleep/```
