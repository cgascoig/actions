workflow "Send notification on push" {
  on = "push"
  resolves = ["WebEx Teams Notification", "Push intersight-ansible-action"]
}

action "Docker hub login" {
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
  secrets = ["WEBEX_TEAMS_ACCESS_TOKEN"]
  args = "--room Chris Gascoigne --message 'Hello from GitHub'"
}
