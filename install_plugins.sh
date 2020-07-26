#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

function showMessage(){
	color=$1
	message=$2
	echo -e "$color$message$NC"
}

function checkIfGitCommandExist(){
    if ! command -v git &> /dev/null
    then
        showMessage ${RED} "[ERROR] Git cli does not found..."
        exit 1
    fi
}

function createBundleFolderIfNotExist(){
    if [ ! -d bundle ]; then
        showMessage ${YELLOW} "[INFO] Creating bundle folder..."
	    mkdir bundle
    fi
}

function clonePluginsRepositories() {
    showMessage ${YELLOW} "[INFO] Installing plugins..."
    git clone https://github.com/mattn/emmet-vim.git ./bundle/emmet-vim
    git clone https://github.com/vim-airline/vim-airline.git ./bundle/vim-airline
    git clone https://github.com/preservim/nerdtree.git ./bundle/nerdtree
    git clone https://github.com/leafgarland/typescript-vim.git ./bundle/typescript-vim
    git clone https://github.com/JamshedVesuna/vim-markdown-preview.git ./bundle/vim-markdown-preview
}


checkIfGitCommandExist
createBundleFolderIfNotExist
clonePluginsRepositories
