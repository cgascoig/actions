from webexteamssdk import WebexTeamsAPI
import sys
import os
import argparse

def main():
    api = WebexTeamsAPI()

    parser = argparse.ArgumentParser()
    parser.add_argument('--room', nargs='*')
    parser.add_argument('--message', nargs='*')
    args = parser.parse_args()
    room_name = ' '.join(args.room)
    user_message = ' '.join(args.message)

    message = f"Event: {os.environ.get('GITHUB_EVENT_NAME')} Repository: {os.environ.get('GITHUB_REPOSITORY')} Commit: {os.environ.get('GITHUB_SHA')} Initiated by: {os.environ.get('GITHUB_ACTOR')} Workflow: {os.environ.get('GITHUB_WORKFLOW')} Message: {user_message}"
    markdown_message = f"""
**Event:** {os.environ.get('GITHUB_EVENT_NAME')} 

**Repository:** {os.environ.get('GITHUB_REPOSITORY')} 

**Commit:** {os.environ.get('GITHUB_SHA')} 

**Initiated by:** {os.environ.get('GITHUB_ACTOR')} 

**Workflow:** {os.environ.get('GITHUB_WORKFLOW')} 

**Message:** {user_message}
    """

    print(f"Attempting to send message '{message}' to room '{room_name}'")
    rooms = api.rooms.list()
    for room in rooms:
        if room.title == room_name:
            print(f"Found room {room.id} with title '{room.title}'")
            api.messages.create(room.id, text=message, markdown=markdown_message)
            return

    print("Room not found, no message sent")

    

if __name__ == "__main__":
    main()

