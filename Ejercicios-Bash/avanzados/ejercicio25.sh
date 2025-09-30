#!/bin/bash

echo "Últimos usuarios que iniciaron sesión con IP:"
last | egrep '[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+'