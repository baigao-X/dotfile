# xrandr --setprovideroutputsource modesetting NVIDIA-0
# xrandr --auto   #关于xrandr的这两行配置，每一行后面都不要加上"&"，否则nvidia驱动不能正常加载，会导致黑屏
# xrandr --dpi 96 -s 2560x1440   #关于xrandr的这两行配置，每一行后面都不要加上"&"，否则nvidia驱动不能正常加载，会导致黑屏
xrandr -s 2560x1440   #关于xrandr的这两行配置，每一行后面都不要加上"&"，否则nvidia驱动不能正常加载，会导致黑屏

#eval "$(dbus-launch --sh-syntax --exit-with-session)" &

export GTK_IM_MODULE=fcitx &
export QT_IM_MODULE=fcitx &
export XMODIFIERS=@im=fcitx &
fcitx &   #使用fcitx中文输入法

picom -CGb &   #使用picom窗口渲染器

#while xsetroot -name "Wifi:$(cat /sys/class/net/<你的无线网卡名>/operstate)|Ethernet:$(cat /sys/class/net/<你的有线网卡名>/operstate)|Battery:$(acpi -b | awk '{print $4}' | cut -d"," -f1)|Volume:$(amixer get Master | awk -F'[][]' 'END{ print $4":"$2 }')|$(LC_ALL='C' date +'%F[%b %a] %R')"   #在dwm的菜单栏里显示一个简易的系统状态栏，包括wifi、有线网、电池电量、音量、日期和时间(24小时制)。喜欢功能丰富的同学可以自己去安装配置polybar、conky、i3status、slstatus等，从中选一个。
#do
#   sleep 60   #每隔1分钟刷新一次状态栏
#done &
#while habak -ms -hi ~/<你的壁纸目录>/   #让habak从你的壁纸目录中随机选择一张屏幕壁纸显示
#do
#   sleep 600   #让habak每隔10分钟随机切换一张屏幕壁纸
#done &
#numlockx &   #自动自动开启数字键盘
exec dwm   #万事具备，启动dwm


