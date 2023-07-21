export XIM_SERVERS=fcitx5
export GTK_IM_MODULE=fcitx5
export QT_IM_MODULE=fcitx5
export XMODIFIERS=@im=fcitx5
export INPUT_METHOD=fcitx5
export PDL_IM_MODULE=fcitx5
export GLFW_IM_MODULE=ibus


# xrandr --setprovideroutputsource modesetting NVIDIA-0
# xrandr --auto   #关于xrandr的这两行配置，每一行后面都不要加上"&"，否则nvidia驱动不能正常加载，会导致黑屏
# xrandr --dpi 96 -s 2560x1440   #关于xrandr的这两行配置，每一行后面都不要加上"&"，否则nvidia驱动不能正常加载，会导致黑屏
# xrandr -s 2560x1440   #关于xrandr的这两行配置，每一行后面都不要加上"&"，否则nvidia驱动不能正常加载，会导致黑屏
xrandr -s 1920x1080   #关于xrandr的这两行配置，每一行后面都不要加上"&"，否则nvidia驱动不能正常加载，会导致黑屏

exec dwm   #万事具备，启动dwm


