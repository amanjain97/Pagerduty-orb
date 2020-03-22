#!/bin/bash

circleci config pack src > orb.yml
circleci orb publish orb.yml amanjain97/pagerduty@dev:alpha
rm -rf orb.yml
