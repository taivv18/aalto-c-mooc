#!/usr/bin/env bash

set -euo pipefail

if [ -d "./exercises/Module_1" ]; then
    ROOT="."
    EXERCISES_DIR="./exercises"
elif [ -d "./Module_1" ]; then
    ROOT=".."
    EXERCISES_DIR="."
else
    echo "Cannot find exercises directory"
    exit 1
fi

OUTPUT_FILE="${ROOT}/progress.md"

progress_bar() {
    local current="$1"
    local total="$2"

    local width=20

    if [ "$total" -eq 0 ]; then
        printf "░░░░░░░░░░░░░░░░░░░░ 0%%"
        return
    fi

    local percent=$((current * 100 / total))
    local filled=$((percent * width / 100))
    local empty=$((width - filled))

    local bar=""

    for ((i = 0; i < filled; i++)); do
        bar+="█"
    done

    for ((i = 0; i < empty; i++)); do
        bar+="░"
    done

    printf "%s %d%%" "$bar" "$percent"
}

status_icon() {
    local percent="$1"

    if [ "$percent" -eq 100 ]; then
        printf "🟩"
    elif [ "$percent" -ge 50 ]; then
        printf "🟨"
    else
        printf "🟥"
    fi
}

generate_progress() {
    local output=""

    total_done=0
    total_all=0

    output+="# 📊 Aalto C MOOC Progress\n\n"

    output+="| Module | Done | Total | Progress |\n"
    output+="|--------|------|-------|----------|\n"

    for module in "${EXERCISES_DIR}"/Module_*; do
        [ -d "$module" ] || continue

        module_name=$(basename "$module")

        done=0
        total=0

        for exercise in "$module"/*; do
            [ -d "$exercise" ] || continue

            ((total += 1))

            xml="$exercise/test/tmc_test_results.xml"

            if [ -f "$xml" ]; then
                if grep -q 'result="success"' "$xml" &&
                    ! grep -q 'result="failure"' "$xml" &&
                    ! grep -q 'result="error"' "$xml"; then
                    ((done += 1))
                fi
            fi
        done

        ((total_done += done))
        ((total_all += total))

        percent=0
        if [ "$total" -gt 0 ]; then
            percent=$((done * 100 / total))
        fi

        icon=$(status_icon "$percent")
        bar=$(progress_bar "$done" "$total")

        output+="| ${module_name} | ${done} | ${total} | ${icon} ${bar} |\n"
    done

    total_percent=0
    if [ "$total_all" -gt 0 ]; then
        total_percent=$((total_done * 100 / total_all))
    fi

    total_icon=$(status_icon "$total_percent")
    total_bar=$(progress_bar "$total_done" "$total_all")

    output+="\n"
    output+="## Overall\n\n"
    output+="${total_icon} ${total_bar}\n\n"
    output+="**${total_done} / ${total_all} completed**\n"

    printf "%b" "$output"
}

echo "Updating progress..."

content="$(generate_progress)"

printf "%b\n" "$content" > "$OUTPUT_FILE"

echo "Updated progress.md ✅"
