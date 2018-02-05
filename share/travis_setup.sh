#!/bin/bash
set -evx

mkdir ~/.racecore

# safety check
if [ ! -f ~/.racecore/.race.conf ]; then
  cp share/race.conf.example ~/.racecore/race.conf
fi
