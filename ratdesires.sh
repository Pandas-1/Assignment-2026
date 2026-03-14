#!/bin/bash
# https://www.youtube.com/watch?v=4EA07LUEMZI
# 
echo "You give a man a rat, you satisfy his RAT DESIRE. You give a man a keyboard, you satisfy his RAT DESIRE."
echo "When ready to type, write "y" and press ENTER."
echo "The timer starts immediately when you press ENTER."
echo "When you are done, press ENTER immediately."
#insert part for difficulty selection

if [ "$1" == "" ]; then
  echo "please specify easy or  medium or  hard as a parameters when running the script "
  exit
fi
play_again=y
while [ "$play_again" == "y" ]; do 
quote=$(shuf -n 1 $1)
while [ "${qoute}" == "" ]
do
  qoute=$(shuf -n 1 $1)
done
echo ""
echo "TEXT: ${quote}"
echo ""
read -n 1 -p "Are you ready to start? [y/n]: " response
echo ""



len=${#quote}

if [ ${response} == "y" ]; then
  initial=${EPOCHREALTIME}
  read -e -n ${len} -p "PROMPT: " input # restricted input length
  diff=$(echo "${EPOCHREALTIME} - ${initial}" | bc)
  # echo ${diff}
else
  exit
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

read -e -n 1 -p "Do you want to play again [y/n]: " play_again 
done

echo "So it seems your RAT DESIRE has been sated."
