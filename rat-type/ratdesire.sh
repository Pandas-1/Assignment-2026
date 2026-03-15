#!/bin/bash
# https://www.youtube.com/watch?v=4EA07LUEMZI
RED='\e[31m'
GREEN='\e[32m'
ENDCOLOR='\e[0m' 
echo "You give a man a rat, you satisfy his RAT DESIRE. You give a man a keyboard, you satisfy his RAT DESIRE."
echo "When ready to type, write "y" and press ENTER."
echo "The timer starts immediately when you press "y"."
echo "When you are done, press ENTER immediately."
#insert part for difficulty selection

if [ "$1" == "" ]; then
  echo "please specify easy or  medium or  hard as a parameters when running the script "
  exit
fi
play_again=y
while [ "$play_again" == "y" ]; do 
quote=$(shuf -n 1 $1)
while [ "${quote}" == "" ]
do
  quote=$(shuf -n 1 $1)
done

read -r  -a words_quote <<< "$quote"
echo ""
echo "TEXT: ${quote}"
echo ""
read -n 1 -p "Are you ready to start? [y/n]: " response
echo ""
incorrect_char=0


len=${#quote}
len_words_quote=${#words_quote[@]}
if [ ${response} == "y" ]; then
  initial=${EPOCHREALTIME}
    
  len=${#quote}
  typed=""
  i=0
  mistake=false

  while true; do
    tput clear
    tput cup 0 0

    for ((j=0; j<${#typed}; j++)); do
      c="${typed:j:1}"
      q="${quote:j:1}"
      if [[ "$c" == "$q" ]]; then
        echo -ne "${GREEN}${c}${ENDCOLOR}"
      else
        echo -ne "${RED}${q}${ENDCOLOR}"
      fi
    done  


    remaining="${quote:${#typed}}"
    echo -ne "${remaining}"


    if [[ ${#typed} -ge ${#quote} ]]; then
      tput cup 1 0
      for ((j=0; j<${#quote}; j++)); do
        if [[ "${typed:j:1}" != "${quote:j:1}" ]]; then
           ((incorrect_char++))     
        fi
      done
      break
    fi
    IFS= read -r -s -n 1 temp

    if [[ $temp == $'\x7f' || $temp == $'\b' ]]; then
      # Backspace
      if [[ ${#typed} -gt 0 ]]; then
        typed="${typed%?}"
      fi
    else
      typed+="$temp"
    fi
  done
   diff=$(echo "${EPOCHREALTIME} - ${initial}" | bc)
  # echo ${diff}
else
  exit
fi


read -r  -a words_input <<< "$input"
# compare quote and input
wordcnt=0
correct_words=0
#echo "${words_input[@]}"
#echo "${words_quote[@]}"
for((i=1; i < $(($len_words_quote+1)); i++)); do
  if [[ "${words_quote[$i]}" == "${words_input[$i]}" ]]; then
     correct_words=$(($correct_words+1))
  fi
done
# echo ${errornum}
# unadjusted wpm calculation
wpm=$(echo "scale=2; (${len}*12)/${diff}" | bc)
acc=$(echo "scale=2; 100 * ($len - $incorrect_char) / $len " | bc)

# crunch the numbers
echo "Raw WPM: ${wpm}"
echo "Accuracy: ${acc}"
finalwpm=$(echo "scale=2; ${wpm}*${acc}/100" | bc)
echo "Final WPM: ${finalwpm}"

read -e -n 1 -p "Do you want to play again [y/n]: " play_again 
done

echo "So it seems your RAT DESIRE has been sated."
