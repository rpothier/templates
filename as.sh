#!/bin/bash

#heat stack-create stack1 --template-file="HAProxy_Single_Instance.template" --parameters="KeyName=build_server;DesiredCapacity=200"

SUBNET=`neutron subnet-list | grep  private-subnet | cut -d " " -f2`

echo "subnet=$SUBNET"
heat stack-create as --template-file=as.template --parameters="SubnetUuid223=$SUBNET;DesiredCapacity=1"


