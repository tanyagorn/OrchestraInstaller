#!/bin/sh

alias proj=$0
eval "mvn compile flyway:migrate"
