import mysql.connector

mydb = mysql.connector.connect(
  host="localhost",
  user="root",
  password="Bhuvneshwari@21",
  database = "youtube_videos"
)

print(mydb)

cursor = mydb.cursor()

cursor.execute('''
    CREATE TABLE IF NOT EXISTS videos(
               id INTEGER PRIMARY KEY AUTO_INCREMENT,
               name TEXT NOT NULL,
               time TEXT NOT NULL
               )
''')

# cursor.execute("SHOW DATABASES")
# for x in cursor:
#     print(x)

# if "youtube_videos" not in cursor:
#     cursor.execute("CREATE DATABASE youtube_videos")
#     print("not in cursor")

def list_videos():
    cursor.execute("SELECT * FROM videos")
    print("-----------------*****LIST OF VIDEOS****------------------")
    counter=1
    for row in cursor.fetchall():
        print()
        for i in range(0,len(row)):
            if i==0:
                print(counter, end="")
                print(".", end=" ")
                counter=counter+1
            elif i==1:
                st=str(row[i]).upper()
                print(st, end=" ")
            elif i==2:
                print(f"Duration={row[i]}")

def add_video(new_name, new_time):
    cursor.execute("INSERT INTO videos (name, time) VALUES (%s, %s)", (new_name, new_time))
    # cursor.execute("INSERT INTO videos (name, time) VALUES (?, ?)", (name, time))
    mydb.commit()

def update_video(video_id, new_name, new_time):
    cursor.execute("UPDATE videos SET name = %s, time = %s WHERE id = %s",(new_name,new_time,video_id))
    mydb.commit()

def delete_video(video_id):
    cursor.execute("DELETE FROM videos WHERE id = %s",(video_id,))
def main():
    while True:
        print("\n Youtube manager app with DB")
        print("1. List Videos")
        print("2. Add Videos")
        print("3. Update Videos")
        print("4. Delete Videos")
        print("5. exit app")
        choice = input("Enter your choice: ")

        if choice == '1':
            list_videos()
        elif choice=='2':
            name = input("Enter the video name: ")
            time = input("Enter the video time: ")
            add_video(name,time)
        elif choice == '3':
            video_id = input("Enter video id to update: ")
            name = input("Enter the video name: ")
            time = input("Enter the video time: ")
 
            update_video(video_id, name, time)
        elif choice == '4':
            video_id = input("Enter video id to delete: ")
            delete_video(video_id)
        elif choice == '5':
            break
        else:
            print("Invalid choice..")

    mydb.close

if __name__ == "__main__":
    main()