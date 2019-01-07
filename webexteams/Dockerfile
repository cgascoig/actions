FROM python:3.6-stretch

LABEL "com.github.actions.name"="WebEx Teams Notification"
LABEL "com.github.actions.description"="Send notification message to WebEx Teams"
LABEL "com.github.actions.icon"="message-circle"
LABEL "com.github.actions.color"="blue"

LABEL "repository"="http://github.com/cgascoig/actions"
LABEL "homepage"="http://github.com/cgascoig/actions"
LABEL "maintainer"="Chris Gascoigne"

ADD requirements.txt /requirements.txt
RUN pip3 install -r requirements.txt

ADD entrypoint.sh /entrypoint.sh
ADD webexteams.py /webexteams.py

ENTRYPOINT [ "/entrypoint.sh" ]