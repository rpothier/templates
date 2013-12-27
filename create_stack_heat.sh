#!/bin/bash


#sleep 10
#heat stack-create stack1 --template-file="HAProxy_Single_Instance.template" --parameters="KeyName=build_server;DesiredCapacity=200"


#for ((n=1; n<=$1; n++)); do
for n in {1..2}; do
    vm_num=$(printf "%04d" $n)
    vm_name="stack-"$vm_num
    echo "heat stack-create $vm_name"
    heat stack-create $vm_name --template-file=HAProxy_Single_Instance_223_224.template --parameters="KeyName=build_server;DesiredCapacity=100"

    echo 'sleep 60'
    sleep 60

done
for n in {3..4}; do
    vm_num=$(printf "%04d" $n)
    vm_name="stack-"$vm_num
    echo "heat stack-create $vm_name"
    heat stack-create $vm_name --template-file=HAProxy_Single_Instance_225_226.template --parameters="KeyName=build_server;DesiredCapacity=100"

    echo 'sleep 60'
    sleep 60

done
for n in {5..5}; do
    vm_num=$(printf "%04d" $n)
    vm_name="stack-"$vm_num
    echo "heat stack-create $vm_name"
    heat stack-create $vm_name --template-file=HAProxy_Single_Instance_227.template --parameters="KeyName=build_server;DesiredCapacity=200"

    echo 'sleep 60'
    sleep 60

done
