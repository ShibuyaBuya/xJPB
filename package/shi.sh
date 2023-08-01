#!/bin/bash
echo "Shi"
# check if shc is installed
if command -v shc > /dev/null; then
    echo "Shc is installed, so skip"
else
    echo "Shc is not installed, abort."
    exit 1
fi
# case $1 for option
version="1.0.0"
help="""
Usage: shi [option] [option] [package]@[version]
Options:
    --help: Show help for usage
    remove [package]: Remove package
    update or -U [package]: Update package or the packinstall itself
    -P [path]: Install package from path file .sbx
    install [package]: Install package
    --list or -l: List all installed packages
    --search or -S [package]: Search package
    --version: Show version of Shi
    project

    init: Initialize project
    run: Run project
    build: Build project into .sbxjpb file


"""

case "$1" in
"--version")
     echo "Shi version $version"
;;
"--help")
     echo "$help"

;;
"install")
     echo "This option is not available yet, cause it's not implemented yet (our developers is lazy to do it)"
     
;;
"remove")
     if [ ! -f "package/$2.sbxjpb" ]; then
          echo "shi: $2: No such package"
     else
          sc=package/$2.sbxjpb
          source $sc
          echo "Project: $name"
          echo "Package: $pname"
          echo "Version: $version"
          echo "Author: $author"
          read -p "Are you sure to remove this package? [y/N]: " < yn
          if [ "$yn" == "N" ] || [ "$yn" == "n" ] || [ -z $yn ]; then
               echo "Aborted. 000039N"
               exit 1
          fi
          echo "Removing package $name"
          rm -rf package/$2
          rm -rf bin/$2

     fi
;;
"init")
     init=null
     echo "© 2023 Shibuya, Tekroid. All rights reserved."
     echo ""
     read -p "Project name (My-project): " name
     if [ -z $name ]; then
          name="My-project"
     fi
     read -p "Project version (1.0.0): " version
     if [ -z $version ]; then
          version="1.0.0"
     fi
     read -p "Project author (Anonymous): " author
     if [ -z $author ]; then
          author="Anonymous"
     fi
     read -p "Package name (my-project): " pname
     if [ -z $pname ]; then
          pname="my-project"
     fi
     init="""
name=$name
version=$version
author=$author
pname=$pname
run=\"bash main.sh\" """
     echo "$init"
     read -p "Is that correct? [Y/n]: " yn
     if [ "$yn" == "N" ] || [ "$yn" == "n" ]; then
          echo "abort."
          exit 1
     elif [ -z $yn ]; then
          echo -e "$init" > package.sbx
          exit 0
     fi

;;
"run")
     if [ ! -f "package.sbx" ]; then
          echo "shi: package.sbx: No such file"
          exit 1
     fi
     source package.sbx
     echo "Running project $name@$version: $pname"
     echo "run: $run"

     $run
;;
"-P")
     echo "Installing from file $2"
     if [ ! -f "$2" ]; then
          echo "shi: $2: No such file"
          exit 1
     fi
     # check if file is .sbxjpb
     if [[ $2 != *.sbxjpb ]]; then
          echo "shi: $2: File must ends with .sbxjpb"
          exit 1
     fi
     source_code=$(cat $2)
     # check every line
     if [[ $source_code != *"sourceFile="* ]]; then
          echo "shi: $2: Something is missing in the file"
          exit 1
     fi
     # get sourceFile
     sourceFile=$(echo $source_code | grep -oP '(?<=sourceFile=").*?(?=")')
     if [ -z $sourceFile ]; thenpa
          echo "shi: $2: Something is missing in the file"
          exit 1
     fi
     
;;
*)
    echo "$help"
;;
esac
