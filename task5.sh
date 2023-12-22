#!/bin/bash

RESET='\e[0m'
RED='\e[31m'
GREEN='\e[32m'

declare -i count=1
declare -i hits=0
declare -i misses=0
declare -a numbers

echo "Step: ${count}"
read -p "Enter number from 0 to 9  " input

while :
do
  number=${RANDOM: -1}
  case "${input}" in
      [0-9])
          echo "Valid input"
          if (( number == input ))
            then
              hits+=1
              echo "You did it! My number: ${number}"
              number_string="${GREEN}${number}${RESET}"
            else
              misses+=1
              echo "Miss! My number: ${number}"
              number_string="${RED}${number}${RESET}"
          fi
          numbers+=(${number_string})
      ;;
      q)
          echo "Bye"
          echo "Exit..."
          break
      ;;
      *)
          echo "Expected number from 0 to 9"
          echo "Repeat"
      ;;
  esac

  count+=1

  total=$(( hits + misses ))
  if (( total == 0))
    then
      hit_percent=0
      misses_percent=0
    else
      let hit_percent=hits*100/total
      let misses_percent=100-hit_percent
  fi

  echo "Hit: ${hit_percent}%" "Miss: ${misses_percent}%"
  let limit=10
  if (( total<10 ))
    then
      limit=total
  fi
  echo -e "Numbers: ${numbers[@]: -limit}"

  echo "Step: ${count}"
  read -p "Please enter number from 0 to 9 : " input
done
