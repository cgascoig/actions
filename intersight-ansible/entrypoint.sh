#!/bin/sh

# echo "${INTERSIGHT_API_KEY_ID}"> /intersight_api_key_id
echo "${INTERSIGHT_API_PRIVATE_KEY}" > /intersight_api_private_key
mkdir /runner/env
printf "---\nintersight_api_key_id: ${INTERSIGHT_API_KEY_ID}" > /runner/env/extravars
printf "---\nANSIBLE_JINJA2_NATIVE: true" > /runner/env/envvars

PLAYBOOK="${PLAYBOOK:-main.yml}"

cp -r /github/workspace/* /runner/project/

ansible-runner -p "${PLAYBOOK}" run /runner
