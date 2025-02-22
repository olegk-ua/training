#!/usr/bin/env python3

import sys
import yaml
import json


with open(sys.argv[1], 'r') as fl:
  try:
    data = yaml.safe_load(fl)
  except yaml.YAMLError as yamlErr:
    print(yamlErr)

print(json.dumps(data))
