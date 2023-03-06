#!/bin/bash

cat <&0 > manifest.yaml
sed '/# Source: runai-event-exporter\/charts\/kubernetes-event-exporter\/templates\/configmap\.yaml/,/^---/d' manifest.yaml
rm manifest.yaml