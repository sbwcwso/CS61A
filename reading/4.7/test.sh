#!/bin/bash

cat haiku.txt | ./count_vowels_mapper.py | sort | ./sum_reducer.py

