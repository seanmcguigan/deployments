#!/bin/env bash

while getopts h: option
  do
case "${option}"
  in
    h) HASH=${OPTARG};;
  esac
done

docker tag seanmcguigan/poker:0.1.0 seanmcguigan/poker:dev-$HASH
docker push seanmcguigan/poker:dev-$HASH

echo "seanmcguigan/poker:dev-$HASH pushed to DockerHub"
echo "sleep 5"

fluxctl sync --k8s-fwd-ns fluxcd
echo "flux sync complete"

