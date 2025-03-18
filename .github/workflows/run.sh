#!/bin/bash
npm install
npm audit fix
export PATH=./node_modules/.bin:$PATH
ng build --configuration production
