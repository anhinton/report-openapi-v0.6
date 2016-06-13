#! /bin/bash
# create a vagrant machine from 'hashicorp/precise32' box in current
# directory

## make vagrant machine directory and go to it
vagrantdir=~/vagrant/precise32
if [ ! -e $vagrantdir ]
then
    mkdir -p $vagrantdir
fi
cd $vagrantdir

## create Vagrantfile
if [ ! -e Vagrantfile ]
then
    vagrant init hashicorp/precise32
fi

## do vagrant up
vagrant up

## back to old dir to create OpenAPI host XML
cd $OLDPWD
echo "<vagrant vagrantfile=\"~/vagrant/precise32/Vagrantfile\"/>" > vagrantMachine.xml
