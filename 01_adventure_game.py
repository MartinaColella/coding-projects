# work on your adventure game below!

rooms = {'bedroom': '\n \n You are in your bedroom. \nIt looks super messy. When was last time you cleaned up?\nThere are some hidden spots you have not cleaned in ages. \n\n Remember what your mum used to say... \"under the bed is a mysterious place\" ' , 
'kitchen': "\n \n You are now in the kitchen. When was last time you saw it clean? \n\nMake sure you check everywhere!", 
'living room': "\n \n  Great, you are now in the living room. \n \nLook in the dog's bed ,\nTHERE YOU HAVE YOUR SOCKS!",
'bathroom': "\n \n  Great, you are now in the bathroom. \nNothing you need is there, but you look like a bush. \nBRUSH YOUR HAIR!",
'laundry': "\n \n  Guess what, you do have a laundry in your house. Maybe you should use it sometimes. \nnow good luck with your search in these piles of clothing. \n\n Oh no, there's nothing"}
leave= {'win' : "\n \n YES YOU HAVE EVERYTHING. NOW RUN TO THE UBAHN",
'lose' : "\n \n Oh no, seems like you forgot something. GAME OVER"}

lucky_socks = False
umbrella = False

name=input("please insert your user name:")
print(f"""
    hello\t{name}!
    You finally have an important interview
    but as always you are running late.
    Get ready in time and make sure you take everything you need

    You need : your lucky socks and your umbrella!
            HURRY UP! """) 

room = "bedroom"
print('you are now in your bedroom.')

a = input(f"\n\n. Do you want to check another room or stay in the bedroom? \nPlease type where you want to go {list(rooms)}").lower() # cant use the .keys function 
while lucky_socks==False or umbrella == False:

    if a == "bedroom":
        room=a 
        print(rooms['bedroom']) 
        b=input("\nUnder the bed there is something colored, what is it?\nIs it the UMBRELLA or your LUCKY SOCKS ?").lower()
        if b=="umbrella": 
            print('\nAmazing, you have found your umbrella!')
            Umbrella = True
            # if you find the umbrella, you can move to the next room
            a=input(f"\nWhere do you want to go next? {list(rooms)} \nType 'leave' if you want to end the game ").lower() # list function to list all the possible rooms (in dictionary)
            if a == 'leave':
                if lucky_socks==False or umbrella == False: 
                    print(leave['lose'])
                else: 
                 print(leave['win'])
                break

        else: 
            print('\nUnfortunately not, the socks are not there. Check somewhere else for the socks')
            a=input(f"\nDo you want to check another room? \n Please type the room you want to check {list(rooms)} \nType 'leave' if you want to end the game").lower()
            if a == 'leave':
                if lucky_socks==False or umbrella == False: 
                    print(leave['lose'])
                else: 
                 print(leave['win'])
                break # breaks the loop and ends the game 

    elif a == "kitchen":
        room=a 
        print(rooms['kitchen'])
        c=input("\nLook what's under the table, did you take it? Y for yes N for no").upper()
        if c=="Y": 
            print('\noh no, it\s not what you are looking for')
        else: 
            print('\nTip: do not take it it looks nasty')
        print("\n\nSeems like there is nothing in here.\n \n") 
        a=input(f"\n Do you want to check another room? \n Please type the room you want to check {list(rooms)} \nType 'leave' if you want to end the game").lower()
        if a == 'leave':
            if lucky_socks==False or umbrella == False: 
                print(leave['lose'])
            else: 
                print(leave['win'])
            break # breaks the loop and ends the game 

    elif a == "living room":
        room=a 
        print(rooms['living room'])
        lucky_socks = True
        a=input(f"\nDo you want to check another room? \n Please type the room you want to check {list(rooms)} \nType 'leave' if you want to end the game").lower()
        if a == 'leave':
            if lucky_socks==True or umbrella == True: 
                print(leave['win'])
            else: 
                print(leave['lose'])
            break # breaks the loop and ends the game 

    elif a== "bathroom":
        room=a 
        print(rooms['bathroom'])
        brushing = True 
        a=input(f"\nDo you want to check another room? \n Please type the room you want to check {list(rooms)} \nType 'leave' if you want to end the game").lower()
        if a == 'leave':
            if lucky_socks==False or umbrella == False: 
                print(leave['lose'])
            else: 
                print(leave['win'])
            break # breaks the loop and ends the game 

    elif a == "laundry":
        room=a 
        print(rooms['laundry'])
        a=input(f"\nDo you want to check another room? \n Please type the room you want to check {list(rooms)} \nType 'leave' if you want to end the game").lower()
        if a == 'leave':
            if lucky_socks==False or umbrella == False: 
                print(leave['lose'])
            else: 
                print(leave['win'])
            break # breaks the loop and ends the game 

    else:
        print("\n \nLuckily you do no't live in a castel. You don't have this room.")
        if a == "laundry" or a != 'bedroom' or a != 'bathroom' or a != 'living room' or a != 'kitchen' or a != 'leave':
            a=input(f"Please chose another room from the ones given {list(rooms)} \nType 'leave' if you want to end the game").lower()
            if a == 'leave':
                if lucky_socks==False or umbrella == False: 
                 print(leave['lose'])
                else: 
                    print(leave['win'])
                break # breaks the loop and ends the game 
 
