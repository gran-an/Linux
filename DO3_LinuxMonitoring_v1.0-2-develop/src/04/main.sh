parameters=$(bash ./config.sh)
if ! [ -z "$parameters" ]; then
    if [[ "$parameters" == "Error" ]]; then
        echo "The first argument should be different from the second and the third argument should be different from the fourth."
        echo "Default:"
        echo "column1_background = 1 (white) column1_font_color = 2 (red) column2_background = 3 (green) column2_font_color = 6 (black)"
        echo "Now:"
        echo $(cat config.conf)
        exit
    fi
    colors=$(bash ./colors.sh ${parameters[@]})
    bash ./output.sh $colors
    bash ./output_colors.sh $parameters
else
    echo "The first argument should be different from the second and the third argument should be different from the fourth."
fi
