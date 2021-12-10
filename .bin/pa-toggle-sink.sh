sink_count=$(pacmd list-sinks | awk '/index:/ { print $3 }' | wc -l)
previous_sink=$(pacmd list-sinks | awk '/\* index:/ { print $3 }')

echo "Sink count: $sink_count"
echo "Previous sink: $previous_sink"

# increment sink number
current_sink=$(($previous_sink+1))

# reset to first sink if we are on the last one.
if [ $current_sink -ge $sink_count ]; then
	current_sink="0"
fi

echo "Current sink: $current_sink"
 
pacmd set-default-sink $current_sink || echo "failed to set sink to $current_sink"
pacmd list-sink-inputs | awk '/index:/{print $2}' |
      xargs -r -I{} pacmd move-sink-input {} $current_sink || echo "failed to move outputs to sink $current_sink"
 
