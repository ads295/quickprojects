#!/bin/bash

########################
#This program is meant to list all users with access to a GitHub repository.
#The program queries the API using a token, retrieves information about collaborators, and parses the JSON using jq such that only the users with read permissions are listed and printed as output.
#
#Created by Aditya Trivedi on 04th October 2025
#Storing repo and owner from CLI arguments

owner=$1
reponame=$2

retrieve_data() {
	curl -L \
	  -H "Accept: application/vnd.github+json" \
	  -H "Authorization: Bearer ${token}" \
	  -H "X-GitHub-Api-Version: 2022-11-28" \
	  https://api.github.com/repos/${owner}/${reponame}/collaborators
  }

output=$(retrieve_data | jq -r '.[] | select(.permissions.pull == true) | .login')
echo $output

#What I learnt from this program:
#How to use jq to selectively parse JSON files
#Using substitution as a means to combine commands
#Accessing the Git API and authenticating using a token
#Generating a token
