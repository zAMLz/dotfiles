# Use this to get the color values from xrdb
# stored into nice variable names.

XBACKGROUND=$(xrdb -query | grep "background:" | awk '{print $2}')
XFOREGROUND=$(xrdb -query | grep "foreground:" | awk '{print $2}')

# Black + DarkGrey
XCOLOR0=$(xrdb -query | grep "color0:" | awk '{print $2}')
XCOLOR8=$(xrdb -query | grep "color8:" | awk '{print $2}')

# DarkRed + Red
XCOLOR1=$(xrdb -query | grep "color1:" | awk '{print $2}')
XCOLOR9=$(xrdb -query | grep "color9:" | awk '{print $2}')

# DarkGreen + Green
XCOLOR2=$(xrdb -query | grep "color2:" | awk '{print $2}')
XCOLOR10=$(xrdb -query | grep "color10:" | awk '{print $2}')

# DarkYellow + Yellow
XCOLOR3=$(xrdb -query | grep "color3:" | awk '{print $2}')
XCOLOR11=$(xrdb -query | grep "color11:" | awk '{print $2}')

# DarkBlue + Blue
XCOLOR4=$(xrdb -query | grep "color4:" | awk '{print $2}')
XCOLOR12=$(xrdb -query | grep "color12:" | awk '{print $2}')

# DarkMagenta + Magenta
XCOLOR5=$(xrdb -query | grep "color5:" | awk '{print $2}')
XCOLOR13=$(xrdb -query | grep "color13:" | awk '{print $2}')

# DarkCyan + Cyan
XCOLOR6=$(xrdb -query | grep "color6:" | awk '{print $2}')
XCOLOR14=$(xrdb -query | grep "color14:" | awk '{print $2}')

# LightGrey + White
XCOLOR7=$(xrdb -query | grep "color7:" | awk '{print $2}')
XCOLOR15=$(xrdb -query | grep "color15:" | awk '{print $2}')
