# 2023-02-12 Original script by Stefan Bohacek:
# https://botwiki.org/resource/tutorial/making-a-mastodon-bot-that-posts-random-images/

import io                      # For handling string I/O
import os                      # For interacting with the operating system
import random                  # For generating random numbers
import requests                # For making HTTP requests
import urllib.request          # For downloading files from the internet
import pandas as pd            # For data manipulation and analysis
from mastodon import Mastodon  # For interacting with the Mastodon API
from bsky_bridge import BskySession, post_image # For posting pics to Bluesky

# URL to the CSV file containing data
data_url = "https://raw.githubusercontent.com/roddie-digital/gits-sac/main/data.csv"
# Path where the images will be saved temporarily
filename = "/tmp/image.png"
filename2 = "/tmp/image.jpg"

def handler(pdm: "pipedream"):
    # Initialize the Mastodon client with access token and API base URL from environment variables
    mastodon = Mastodon(
        access_token=os.environ.get("MASTODON_ACCESS_TOKEN"),
        api_base_url=os.environ.get("MASTODON_INSTANCE"),
        request_timeout=100
    )

    # Fetch the CSV data from the specified URL
    csv = requests.get(data_url).content
    # Read the CSV data into a pandas DataFrame
    df = pd.read_csv(io.StringIO(csv.decode('utf-8')))
    # Convert the DataFrame to a list of dictionaries (records)
    data = df.to_dict(orient='records')

    # Filter the data to include only items with valid 'image_url' and 'text'
    data = [item for item in data
        if ("image_url" in item and type(item["image_url"]) == str and item["image_url"])
        and ("text" in item and type(item["text"]) == str and item["text"])
    ]

    # Randomly select an item from the filtered data
    item = random.choice(data)
    image_url = item["image_url"]  # Get the image URL from the selected item

    # Download the image from the image URL and save it to the specified filename
    urllib.request.urlretrieve(image_url, filename)

    # Upload the image to Mastodon and get the media ID
    media_upload_mastodon = mastodon.media_post(filename)
    # Post the status to Mastodon with the associated media
    post = mastodon.status_post(item["text"], media_ids=media_upload_mastodon, sensitive=item.get("sensitive", False))
    
    # Bluesky
    # Randomly select a new item from the filtered data
    item2 = random.choice(data)
    image_url2 = item2["image_url"]  # Get the image URL from the selected item

    # Download the image from the image URL and save it to the specified filename
    urllib.request.urlretrieve(image_url2, filename2)
  
    # Get the Bluesky environment variables
    bsky_handle=os.environ.get("BLUESKY_HANDLE")
    bsky_app_passwd=os.environ.get("BLUESKY_PASSWD")

    # Create the Bluesky session
    session = BskySession(bsky_handle, bsky_app_passwd)

    # Create the Bluesky post
    postText = item2["text"]
    imagePath = filename2
    response = post_image(session, postText, imagePath)
    print(response)

    return post  # Return the Mastodon posted status
