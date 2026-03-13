#!/bin/bash
echo "You give a man a rat, you satisfy his RAT DESIRE. You give a man a keyboard, you satisfy his RAT DESIRE."
echo "When ready to type, write "y" and press ENTER."
echo "The timer starts immediately when you press ENTER."
echo "When you are done, press ENTER immediately."

quote="the quick brown fox jumped over my aaaah"
echo ""
echo "TEXT: ${quote}"
echo ""

echo "Are you ready to start? [y/n] "
read response

len=${#quote}

if [ ${response} == "y" ]; then
  initial=${EPOCHREALTIME}
  read -e -n ${len} -p "PROMPT: " input # restricted input length
  diff=$(echo "${EPOCHREALTIME} - ${initial}" | bc)
  # echo ${diff}
fi

# compare quote and input
errornum=0
wordcnt=0
for (( i=0; i<${len}; i++ )); do
  char1=${quote:$i:1}
  char2=${input:$i:1}

  if [[ "${char1}" != "${char2}" ]]; then
    errornum=$((errornum+1))
  fi
done
# echo ${errornum}

# unadjusted wpm calculation
wpm=$(echo "scale=2; (${len}*12)/${diff}" | bc)
acc=$(echo "scale=2; 100-(${errornum}*100/${len})" | bc)

# crunch the numbers
echo "Raw WPM: ${wpm}"
echo "Accuracy: ${acc}"
finalwpm=$(echo "scale=2; ${wpm}*${acc}/100" | bc)
echo "Final WPM: ${finalwpm}"
