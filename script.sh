#!/bin/sh

repo="http://192.168.189.246:8081/"
group=$groupId
artifact=$artifactId
version=$Version

if [[ $type == "" ]]; then
  type="war"
fi
if [[ $classifier != "" ]]; then
  classifier="-${classifier}"
fi

groupIdUrl="${group//.//}"
filename="${artifact}-${version}${classifier}.${type}"

if [[ ${version} == *"SNAPSHOT"* ]]; then repo_type="snapshots"; else repo_type="releases"; fi

if [[ $repo_type == "releases" ]]
 then
 wget --user admin --password 341Zbojw@ --no-check-certificate "${repo}/repository/releases/${groupIdUrl}/${artifact}/${version}/${artifact}-${version}${classifier}.${type}" -O ${filename} -k
 else
   versionTimestamped=$(wget --user admin --password 341Zbojw@ -q -O- --no-check-certificate "${repo}/repository/snapshots/${groupIdUrl}/${artifact}/${version}/maven-metadata.xml" | grep -m 1 \ | sed -e 's/\(.*\)<\/value>/\1/' | sed -e 's/ //g')
   echo "$versionTimestamped"
   wget --user admin --password 341Zbojw@ no-check-certificate "${repo}/repository/snapshots/${groupIdUrl}/${artifact}/${version}/${artifact}-${versionTimestamped}${classifier}.${type}" -O ${filename}
 fi
 
