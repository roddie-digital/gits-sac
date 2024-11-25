Take screenshots from Ghost in Shell series and films and post them to Mastodon and Bluesky every two hours. Toots with no interaction auto-delete after two weeks. Blu-rays are ripped with MakeMKV, screenshots are taken with ffmpeg (via a Powershell script snapping every 𝑥 seconds) and Pipedream runs a Python script using the [Mastodon.py](https://pypi.org/project/Mastodon.py/) and [bsky-bridge](https://pypi.org/project/bsky-bridge/) modules to post (different) images on [Mastodon](https://roddie.social/@ghostintheshell) and [Bluesky](https://bsky.app/profile/ghostintheshell.roddie.digital). Posts are tagged with specific hashtags in case followers want to mute Arise or maybe everything except the 1995 film, for example. Both accounts are also bridged to the other side using [Bridgy Fed](https://fed.brid.gy/) with the users [@ghostintheshell.roddie.social](https://bsky.app/profile/ghostintheshell.roddie.social) and `@ghostintheshell.roddie.digital@bsky.brid.gy`

The project was inspired by [Stefan Bohacek](https://stefanbohacek.online/@stefan) and his guide [Making a Mastodon bot that posts random images](https://botwiki.org/resource/tutorial/making-a-mastodon-bot-that-posts-random-images/). I modified his script to use image files stored in Github rather than Google Drive, removed the alt tag field and added a sensitivity field. The bot was originally made possible by [Colin Mitchell](https://muffin.industries/@colin)'s Mastodon server [botsin.space](https://botsin.space). Both Mastodon.py and bsky-bridge modules are licensed under [MIT licences](licences).

Mastodon bot currently including the following content:

- Ghost in the Shell (1995) [#SAContext1995](https://roddie.social/tags/SAContext1995)
- Stand Alone Complex series 1 episodes 1-7 [#StandAloneContext](https://roddie.social/tags/StandAloneContext)
- Innocence [#SAContextInnocence](https://roddie.social/tags/SAContextInnocence)
- Solid State Society [#SAContext](https://roddie.social/tags/SAContext)
- Arise - Borders 1-4 [#SAContextArise](https://roddie.social/tags/SAContextArise)
- Arise - Pyrophoric Cult [#SAContextArise](https://roddie.social/tags/SAContextArise)
- The New Movie [#SAContextTNM](https://roddie.social/tags/SAContextTNM)

Bluesky bot currently including the following content:

- SAC_2045 series 1 episodes 1-12 [#SAC2045](https://bsky.app/hashtag/SAC2045)

To be added:

- The rest of Stand Alone Complex series 1
- Stand Alone Complex 2nd GIG (series)
- SAC_2045 series 2

Might be added:

- Ghost in the Shell 2.0 (film)
- Ghost in the Shell (2017)

