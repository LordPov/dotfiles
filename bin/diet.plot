set xdata time
set timefmt "%d/%m/%Y"
set title "Rendo's Diet"
set ylabel "Weight \(kg\)"
set grid
set key box
set terminal png size 2560,1600 font 'Arial Unicode'
set output "~/Pictures/BrendonsDiet.png"
set pointsize 1.5
plot '< genDietData.py' using 1:2 title "Desired" with linespoints, '' using 1:3 title "Actual" lt 3 with linespoints
