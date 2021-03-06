#!/usr/bin/gnuplot
#
# Sequential color maps from colorbrewer
#
# AUTHOR: Hagen Wierstorf
# gnuplot 4.6 patchlevel 0

reset

# wxt
#set terminal wxt size 1024,686 enhanced font 'Verdana,10' persist
# png
set terminal pngcairo size 1024,686 enhanced font 'Verdana,10'
set output 'sequential.png'


unset border
unset key
unset tics
unset colorbox

# function for lines
set xrange [0:pi]
f(x,i) = cos(x - 1.0 + i/10.0)

set multiplot layout 6,6

do for [pal in "Blues BuPu Greens Oranges PuBuGn PuRd RdPu YlGnBu YlOrBr BuGn GnBu Greys OrRd PuBu Purples Reds YlGn YlOrRd"] {
    filename = '../sequential/'.pal.'.plt'
    load filename
    # plot colorbar
    set lmargin 4
    set rmargin 4
    plot 'data_8.txt' u 1:2:3 w image
    # plot lines
    set label 1 pal at -1,0 left front
    set lmargin -6
    set rmargin 1
    plot for [ii=1:8] f(x,ii) ls ii lw 2
    unset label
}

unset multiplot
