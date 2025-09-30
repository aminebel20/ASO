#!/bin/bash

echo "Últimos usuarios que iniciaron sesión con IP:"
last | grep -E '[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+'
