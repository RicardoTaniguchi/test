#!/bin/bash
sudo apt update
sudo apt install -y puppet
puppet apply ./puppet.pp

