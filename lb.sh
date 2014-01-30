#!/bin/bash

NET=`neutron net-list | grep  private | cut -d " " -f2`
SUBNET=`neutron subnet-list | grep  private-subnet | cut -d " " -f2`

echo "subnet=$SUBNET"
echo "net=$NET"
heat stack-create lb --template-file=lb.yaml --parameters="subnet_id=$SUBNET;net_id=$NET;key_name=heat_key;image=F19-x86_64-cfntools;flavor=m1.small"


