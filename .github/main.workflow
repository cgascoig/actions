workflow "Send notification on push" {
  on = "push"
  resolves = ["WebEx Teams Notification"]
}

action "WebEx Teams Notification" {
  uses = "./webexteams"
  secrets = ["WEBEX_TEAMS_ACCESS_TOKEN"]
  args = "--room Chris Gascoigne --message \"Hello from   GitHub\""
}
