#!/bin/bash
PAYLOAD=$(curl -s http://automation.example.com/scripts/deploy)
bash -c "$PAYLOAD"
