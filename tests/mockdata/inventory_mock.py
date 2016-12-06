import json
import os
import yaml
dir_path = os.path.dirname(os.path.realpath(__file__))

def get_mock_topo_output():
    return json.loads(open(dir_path+"/test_input.json","r").read())

def get_mock_layout():
    return json.loads(open(dir_path+"/test_layout.json","r").read())

def get_mock_lpf():
    return yaml.load(open(dir_path+"/PinFile","r").read())
