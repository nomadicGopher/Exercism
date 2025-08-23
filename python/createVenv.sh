#!/bin/bash

# Create a virtual environment with access to system site packages
python -m venv venv --system-site-packages

# Activate the virtual environment
source venv/bin/activate

# Install the required packages
pip install pytest-cache pytest-subtests
