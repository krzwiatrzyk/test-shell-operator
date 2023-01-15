#!/usr/bin/env bash

if [[ $1 == "--config" ]] ; then
  cat trigger/pod_added.yaml
else
  podName=$(jq -r .[0].object.metadata.name $BINDING_CONTEXT_PATH)
  echo "Pod '${podName}' added"
fi
