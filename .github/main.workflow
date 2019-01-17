workflow "Send notification on push" {
  on = "push"
  resolves = ["WebEx Teams Notification"]
}

# Filter for master branch
action "Master" {
  uses = "actions/bin/filter@master"
  args = "branch master"
}

action "Docker hub login" {
  needs = ["Master"]
  uses = "actions/docker/login@master"
  secrets = ["DOCKER_USERNAME", "DOCKER_PASSWORD"]
}

action "Build intersight-ansible-action" {
  uses = "actions/docker/cli@master"
  needs = ["Docker hub login"]
  args = "build -t cgascoig/intersight-ansible-action:latest intersight/"
}

action "Push intersight-ansible-action" {
  uses = "actions/docker/cli@master"
  needs = ["Build intersight-ansible-action"]
  args = "push cgascoig/intersight-ansible-action:latest"
}

action "WebEx Teams Notification" {
  uses = "./webexteams"
  needs = ["Push intersight-ansible-action"]
  secrets = ["WEBEX_TEAMS_ACCESS_TOKEN"]
  args = "--room Chris Gascoigne --message 'New push, all actions completed'"
}
