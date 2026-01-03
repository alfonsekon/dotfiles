#!/bin/bash

echo TLP_ENABLE=0 > /etc/tlp.d/01-tlp-status.conf

sudo tlp start
