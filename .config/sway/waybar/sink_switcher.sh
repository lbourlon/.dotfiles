#!/bin/bash

SINKS=$(pactl -f json list sinks)
list_sinks() { echo "$SINKS"; }

get_sink_name_from_id() {
    list_sinks | jq ".[] | select(.index==$1) | .description"
}

change_sink_to_id() {
    pactl set-default-sink "$2"
    notify-send "$1" "$(get_sink_name_from_id "$2")"
}

current_sink=$(list_sinks | jq ".[] | select( .name | contains(\"$(pactl get-default-sink)\")) | .index")

active_index=-1
i=0
sink_ids=()

# Get all ids into list and find where the active one is
for sink_id in $(list_sinks | jq ".[].index"); do
    sink_name=$(get_sink_name_from_id "$sink_id")
    if [[ "$sink_name" =~ "HDMI" ]]; then
        echo "ignored : sink_id($sink_id) -> $sink_name"
        continue
    fi
    if [[ "$current_sink" == "$sink_id" ]]; then active_index=$i; fi

    echo "kept    : sink_id($sink_id) -> $sink_name"
    sink_ids+=("$sink_id")
    i=$((i + 1))
done

last_index=$((${#sink_ids[@]} -1))
if (( last_index <= 0 )); then
    notify-send "Not enough audio sinks found, unchanged"
    echo "Not enough sinks !"; exit;
fi

if (( active_index == -1 )); then
    echo "Couldn't current your sink";
    change_sink_to_id "Couldn't find previous, setting audio sink to" "${sink_ids[0]}"
    exit;
fi

# If it's the last, select the first, otherwise, select next one
new_default=$(( active_index + 1 ))
if (( active_index == last_index )); then
    new_default=0
fi

change_sink_to_id "Changed audio sink to" "${sink_ids[$new_default]}"
