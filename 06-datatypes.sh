#!/bin/bash

PERSONS=("Ramesh" "Suresh" "Manoj" "sandy")

echo "First person: ${PERSONS[0]}"

#inside the array we can always refer the values with the index and it starts from 0

echo "Display all persons name: ${PERSONS[@]}" #@ specify all and display all names/numbers 