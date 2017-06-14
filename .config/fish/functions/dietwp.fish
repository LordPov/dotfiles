function dietwp -d "Generate diet progress chart and update desktop background"
    gnuplot ~/bin/diet.plot
    killall Dock
end
