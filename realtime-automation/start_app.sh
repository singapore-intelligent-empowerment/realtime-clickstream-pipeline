#!/bin/bash

# start business system
export PROJECT_HOME=~/projects/realtime

update_repo(){
    cd ${PROJECT_HOME}
    git pull
}

run_buz_sys(){
     echo "Run Business System ..."
     cd ${PROJECT_HOME}/realtime-business-system
     npm install
     bower install
     npm start &
}

# Run NodeJS app consume data from MongoDB
run_node_app(){
    echo "Run Node App ..."
    cd ${PROJECT_HOME}/realtime-service
    npm install
    npm start &
    return
}

# Run Dashboard app
run_dashboard(){
    echo "Run Dashboard ..."
    cd ${PROJECT_HOME}/realtime-dashboard
    npm run build
    npm run start
}


update_repo
run_buz_sys
run_node_app
run_dashboard
exit 0