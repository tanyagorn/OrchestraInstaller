#!/bin/sh
# Not a good idea to clean exists schema, should use
# "./flyway migrate"
# But leave it like this for now, so don't need to drop db while testing
alias proj=$0
eval "./flyway clean migrate"
