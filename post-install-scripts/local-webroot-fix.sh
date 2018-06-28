#!/usr/bin/env bash

# Color variables
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

# Check that we are running this script from the correct folder
if [ ! -d "../../conf" ]; then
    if [ $1 == "--check-folder" ]; then
        printf "${RED}Could not find config-folder. Are you sure you are running this from the correct folder? Correct folder would be something like this: \"app/public\"${NC}\n"
    else
        printf "${YELLOW}You are probably not using Local by Flywheel. If you are, then please check that you are running this script from the correct location which should be someething like this: \"app/public\"${NC}\n"
    fi
    exit
fi

# Array of paths to web server config files
declare -a paths=(
    "../../conf/nginx/site.conf"
    "../../conf/apache/sites-enabled/000-default.conf"
    "../../conf/apache/sites-available/000-default.conf"
);

echo "Migrating Local by Flywheel web server config to be compliant with Dekode's Bedrock-based WP setup..."
echo "==="

for i in "${paths[@]}"
do :

    # Check if file exists
    if [ ! -f $i ]; then
        continue
    fi

    content=$(cat $i)

    printf "Updating config file with new path: $i"
    sleep .2

    # Check if file is already migrated
    if [[ $content = *"/app/public/web"* ]]; then
        printf " - ${GREEN}File already migrated${NC}\n"
        continue
    fi

    # NGINX
    pattern="root /app/public/"
    new_string="root /app/public/web/"
    new_content=${content//$pattern/$new_string}

    # APACHE
    pattern="DocumentRoot /app/public"
    new_string="DocumentRoot /app/public/web"
    new_content=${new_content//$pattern/$new_string}

    # APACHE
    pattern="<Directory /app/public/>"
    new_string="<Directory /app/public/web/>"
    new_content=${new_content//$pattern/$new_string}

    # Write new content
    echo "$new_content" > $i
    printf " - ${GREEN}Done${NC}\n"

done

echo "==="
printf "${GREEN}All done!\n"
printf "Please restart the container (site) to apply the changes!${NC}\n"