#!/bin/bash

# Dump currently active
default_sink=$(pactl -f json list sinks short | jq ".[] | select( .name | contains(\"$(pactl get-default-sink)\")) | .index")

active_index=-1
i=1
sink_ids=$()

# Get all ids into list and find where the active one is
# first element already populated with nothing
# ('', 'id_1', 'id_2'), why bash ? why ?
for sink in $(pactl -f json list sinks short | jq ".[].index"); do
    sink_ids+=("$sink")
    if [[ "$default_sink" == "$sink" ]]; then active_index=$i; fi
    i=$((i + 1))
done

last_id=$((${#sink_ids[@]} - 1 )) #  -1 to get last id
if (( active_index == -1 )); then echo "Couldn't find your sink"; exit; fi
if (( last_id <= 1 )); then echo "Not enough sinks"; exit; fi

# If it's the last, select the first, otherwise, select next one
new_default=$(( active_index + 1 ))
if (( active_index == last_id )); then
    new_default=1
fi

pactl set-default-sink ${sink_ids[$new_default]}

get_name=$(pactl -f json list sinks | jq ".[] | select(.index==${sink_ids[$new_default]}) | .description")
notify-send 'Changed Default Sink' "$get_name"
