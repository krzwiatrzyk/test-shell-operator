#!/usr/bin/env bash

if [[ $1 == "--config" ]] ; then
  cat trigger/container_restarted.yaml
  #cat trigger/pod_added.yaml
else
  podName=$(jq -r .[0].object.metadata.name $BINDING_CONTEXT_PATH)
  if [[ ${podName} == "null" || ${podName} == "" ]]; then
    exit 0
  fi
  apprise -t "Restart alert!" -b "Container in ${podName} was restarted" "gotifys://gotify.mirai.windkube.com/${GOTIFY_TOKEN}"
fi
