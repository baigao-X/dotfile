# xrandr --setprovideroutputsource modesetting NVIDIA-0
# xrandr --auto   #关于xrandr的这两行配置，每一行后面都不要加上"&"，否则nvidia驱动不能正常加载，会导致黑屏
# xrandr --dpi 96 -s 2560x1440   #关于xrandr的这两行配置，每一行后面都不要加上"&"，否则nvidia驱动不能正常加载，会导致黑屏
xrandr -s 2560x1440   #关于xrandr的这两行配置，每一行后面都不要加上"&"，否则nvidia驱动不能正常加载，会导致黑屏

exec dwm   #万事具备，启动dwm


