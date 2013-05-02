# Exosense Device Template Application Build
**(C) 2013 Feuerlabs, Inc - All Rights Reserved**

# Documentaion Locations

1. **Building flashable Exosense Device Demo application image**<br>
Please see the README.md file at
 `https://github.com/Feuerlabs/exosense_specs` .<br> This repo contains
the exosense_demo_tutorial.pdf file with complete instructions on setting up
a build system, creating an Exosense Device image, deploying and testing it
on target hardware.

2. **Building Exosense Device Demo application for desktop use**<br>
This document.

3. **Exosense Server Usage**<br>
Please see the README.md file at
 `https://github.com/Feuerlabs/exosense_specs` .<br> This repo contains
an Exosnese Server User Manual, a JSON-RPC Reference Manual, and
sample shell scripts using curl(1) to interface the server.

# Introduction

This repository contains the Yocto recipes to build the demo
application running on top of the Exosense Device software stack.

Please note that the demo application source code is checked out from

    git://github.com/Feuerlabs/exodemo.git

by the recipe found under `recpies-exodemo/exodemo/erlang-exodemo_git.bb`

# Creating target-specific, flashable images

Please see:

    git://github.com/Feuerlabs/exosense_specs.git

and its `doc/exosense_demo_tutorial.pdf` file for detailed
instructions on how to build and flash an image with the demo
application on target hardware.

# Building demo application on a local machine

Install Erlang R15B1 or on the machine that is to run the demo. If
precompiled packages are not available for the target environment, the
source code is available at `http://www.erlang.org`.

Install rebar from `https://github.com/basho/rebar`. Once built, copy
the target `rebar` binary to `/usr/local/bin` or another directory in
the search path of the shell.

## Compiling the code

The demo application can be built with a simple make command:

    make

Before running the demo, create a setup directory with the relevant Erlang boot and configuraiton files:

    make setup

## Setup a Device Identity
Edit the `local_start_demo.sh` script and set the device identity in
the `exo_xxx` environment variables as described in the
`exosense_demo_tutorial.pdf` document's "Setting Device Identity"
chapter.

## Provision the Exosense Server
Follow the instructions in the demo tutorial's "Adding Device to
Exosense Server through JSON-RPC" chapter.

## Run the demo application

    sh local_start_demo.sh

See the demo tutorial's chapter "Invoking Device RPC through Exosense
Server JSON-RPC commands" for details.


# Changing the code

A simple `make` and restart of the `local_start_demo.sh` will compile
and restart the demo applica tion.

Please see "Installing recompiled Erlang beam files on Device" chapter
of the demo tutorial for instructions on how to copy beam files to the
target hardware.


    

