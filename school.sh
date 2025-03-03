#!/bin/bash

cat Property_Tax_Roll.csv | grep "MADISON SCHOOLS" | cut -d ',' -f7 | {  
  sum=0  
  count=0  
  while read -r value; do  
    sum=$((sum + value))  
    ((count++))  
  done  
  if ((count > 0)); then  
    echo $((sum / count))  
  fi  
}
