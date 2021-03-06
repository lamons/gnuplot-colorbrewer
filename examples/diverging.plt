#!/usr/bin/gnuplot
#
# Diverging color maps from colorbrewer
#
# AUTHOR: Hagen Wierstorf
# gnuplot 4.6 patchlevel 0

reset

# wxt
#set terminal wxt size 1024,343 enhanced font 'Verdana,10' persist
# png
set terminal pngcairo size 1024,343 enhanced font 'Verdana,10'
set output 'diverging.png'


unset border
unset key
unset tics
unset colorbox

# function for lines
set xrange [0:pi]
f(x,i) = cos(x - 1.0 + i/10.0)

set multiplot layout 3,6

do for [pal in "BrBG PiYG PRGn PuOr RdBu RdGy RdYlBu RdYlGn Spectral"] {
    filename = '../diverging/'.pal.'.plt'
    load filename
    # plot colorbar
    set lmargin 4
    set rmargin 4
    plot 'data_11.txt' u 1:2:3 w image
    # plot lines
    set label 1 pal at -1,0 left front
    set lmargin -6
    set rmargin 1
    plot for [ii=1:11] f(x,ii) ls ii lw 2
    unset label
}

unset multiplot
