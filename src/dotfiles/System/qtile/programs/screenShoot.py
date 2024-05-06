from PIL import ImageGrab
import random
import os


try:
    screenshot = ImageGrab.grab() # screen

    random_number = random.randint(1, 1000)     # random image name
    file_name = f"~/screen{random_number}.png"

    user_home = os.path.expanduser("~") # user name path
    screenshot.save(f"{user_home}/screen{random_number}.png") # save image file

except ValueError:
    print(f"""Random Number: {random_number}\n 
              File Name: {file_name}\n
              User Home: {user_home}\n """)