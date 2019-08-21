# MiniShortener

### Web App Map:

**root path or '/links'** - input field for original url and the button to process it and get shorten one.
**'/visits'** - something like a logs page that shows the data of last 100 visits (url, ip address, location)
**'/statistics'** - generated statistics for optional tasks (uniq visit count vs total visit count, in what country the app is more popular, what link is more clickable)

### Retro

1. __*What went well?*__

Architecture Design Process went well. Also connecting Redis, Sidekiq and implementing back end logic in general went well.
Preparing fake data for the project was super fast and easy (thanks to Faker gem).

2. __*What didn’t go well?*__

Styling and design could go more smoothly... I'm not telling that I don't like working on them rather it was a while ago when I did it last time.

3. __*If I had more time to work on this...*__

I would have some fun by adding React to this project.
I would think what what other feature I could implement here that may be useful.
I would run some stress testing with high load.
I would spend some time on investigating the idea of project viability without databases (if we want to have like only basic logic - "shorten" and "unshorten"). I would check if it's possible to do only by some algorithm. It seems that a 'performance' challange would become less challenging in that case.
I would add a navigation bar and add more sweet styles :]
I would like to deploy the project on some of free services to have an opprotunity to play around without setting it up and running locally.
I would replace the current inconvenient way of presenting a shorten link to user with something "easy go".

A couple of things that I've almost started working on:
- Adding React
- Implementing a few Cron jobs that runs by timer, prepare big data selection for the Statistics page and save result to Redis cache - so when a person come for statistics, it renders just lightning fast. (the real benefit we noticed on huge-huge data).
- Writing tests and error handling.
- Replacing the inconvenient way
- Some kind of a box at the top of the page that represents "Total visits count" in real time. (it's mostly just an idea... to have some sportful feature to keep a user engaged)

https://imgur.com/a/MGW5nVU

