import io
import os
import random
import requests
import urllib.request
import pandas as pd
from mastodon import Mastodon

data_url = "https://raw.githubusercontent.com/roddie-digital/gits-sac/main/data.csv"
filename = "/tmp/image.png"

def handler(pdm: "pipedream"):
    mastodon = Mastodon(access_token=os.environ.get("MASTODON_ACCESS_TOKEN"), api_base_url=os.environ.get("MASTODON_INSTANCE"), request_timeout=100)

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

    media_upload_mastodon = mastodon.media_post(filename)
    post = mastodon.status_post(item["text"], media_ids = media_upload_mastodon)

    return post
