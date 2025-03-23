#!/bin/sh

# paths
venv_name='.venv'
venv_path=$PWD/$venv_name

# unix paths
# activate_path="$venv_path/bin/activate"

# windows paths
activate_path="$venv_path/Scripts/activate"
alias python='py.exe'  # Windows

# abort if venv already exists
if [ -d $venv_path ]; then
    >&2 echo "$venv_path already exists! aborting..."
    exit -1
fi

# initialize the venv
python -m venv $venv_path
source $activate_path
pip install --upgrade pip setuptools

# install project in the venv
pip install .[extra]
