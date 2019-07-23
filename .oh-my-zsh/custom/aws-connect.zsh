function connect {
  asg=$@
  instance_ids=$(aws autoscaling describe-auto-scaling-groups --auto-scaling-group-names $asg | jq '.AutoScalingGroups[0].Instances[].InstanceId' | sed 's/"/\\"/g' | xargs)
  command="aws ec2 describe-instances --instance-ids $instance_ids"
  result=$(eval $command)
  public_hostnames=($(echo $result | jq --raw-output '.Reservations[].Instances[].PublicDnsName' | xargs))
  instances=($(echo $result | jq --raw-output '.Reservations[].Instances[].InstanceId' | xargs))
  public_ips=($(echo $result | jq --raw-output '.Reservations[].Instances[].PublicIpAddress' | xargs))
  private_ips=($(echo $result | jq --raw-output '.Reservations[].Instances[].PrivateIpAddress' | xargs))
  if [ "$#public_hostnames" -gt "1" ]; then
    for i in {1..$#public_hostnames}; do
      printf '[%s] %-20s %-16s (%s)\n' "$i" "${instances[$i]}" "${public_ips[$i]}" "$private_ips[$i]"
    done
    printf "Choice [1]: "
    read choice
  fi
  choice="${choice:=1}"
  ssh -i ~/.ssh/jpatterson.pem ubuntu@${public_hostnames[$choice]}
}
