#!/bin/sh

repo="http://192.168.189.246:8081"
group=$groupId
artifact=$artifactId
version=$Version

if [[ $type == "" ]]; then
  type="war"
fi
#if [[ $classifier != "" ]]; then
 # classifier="-${classifier}"
#fi

groupIdUrl="${group//.//}"
filename="${artifact}-${version}.${type}"

wget --user admin --password 341Zbojw@  "${repo}/repository/maven-public/${groupIdUrl}/${artifact}/${version}/maven-metadata.xml"

versionTimestamped=$(grep -m 1 "value" "maven-metadata.xml" | awk -F ">" '{print $2}' | awk -F "<" '{print $1}')

   wget --user admin --password 341Zbojw@  "${repo}/repository/maven-public/${groupIdUrl}/${artifact}/${version}/${artifact}-${versionTimestamped}.${type}" -O ${filename}
