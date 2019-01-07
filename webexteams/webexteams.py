from webexteamssdk import WebexTeamsAPI
import sys
import argparse

def main():
    api = WebexTeamsAPI()

    parser = argparse.ArgumentParser()
    parser.add_argument('--room', nargs='*')
    parser.add_argument('--message', nargs='*')
    args = parser.parse_args()
    room_name = ' '.join(args.room)
    message = ' '.join(args.message)

    print(f"Attempting to send message '{message}' to room '{room_name}'")
    rooms = api.rooms.list()
    for room in rooms:
        print(f"comparing '{room.title}' with '{room_name}''")
        if room.title == room_name:
            print(f"Found room {room.id} with title '{room.title}''")
            api.messages.create(room.id, text=message)
            return

    print("Room not found, no message sent")

    

if __name__ == "__main__":
    main()

