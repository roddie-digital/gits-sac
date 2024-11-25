# 2024-11-24 https:/roddie.digital
# Post to just Bluesky using bsky-bridge

# Original script by Stefan Bohacek:
# https://botwiki.org/resource/tutorial/making-a-mastodon-bot-that-posts-random-images/

import io
import os
import random
import requests
import urllib.request
import pandas as pd
from bsky_bridge import BskySession, post_image

data_url = "https://raw.githubusercontent.com/roddie-digital/gits-sac/main/data2045.csv"
filename = "/home/roddie/tmp/image.jpg"

csv=requests.get(data_url).content
df=pd.read_csv(io.StringIO(csv.decode('utf-8')))
data = df.to_dict(orient='records')

data = [item for item in data
    if ("image_url" in item and type(item["image_url"]) == str and item["image_url"])
    and ("text" in item and type(item["text"]) == str and item["text"])
]

item = random.choice(data)
image_url = item["image_url"]

urllib.request.urlretrieve(image_url, filename)

# Randomly select a new item from the filtered data
item = random.choice(data)
image_url = item["image_url"]  # Get the image URL from the selected item

# Download the image from the image URL and save it to the specified filename
urllib.request.urlretrieve(image_url, filename)

# Create the Bluesky session with handle and app password
session = BskySession("ghostintheshell.roddie.digital", "")

postText = item["text"]
imagePath = filename
response = post_image(session, postText, imagePath)
print(response)
