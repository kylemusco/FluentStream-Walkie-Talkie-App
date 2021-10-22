# FluentStream iOS Interview Challenge

This is my submission for FluentStream's "Walkie-Talkie App" interview challenge. If you're also interviewing, feel free to build off of what I have here

## Prerequisites 

You will need [Node JS](https://nodejs.org/en/download/) to run the mock backend

Then download the mock backed with:
```bash
git clone https://github.com/fluentstream/walkie_talkie_backend
```

To run the backend:
```bash
npm install
node app.js
```

Before running the app, open `Utilities/Constants.swift` and set `URL` to the IP address of the backend

<br />

## The Problem

The goal of this exercise is to understand how you think and work through problems which may not have a clearly defined go-forward path. As this is a senior role, it is our expectation that you are able to discover a user’s needs, technology’s constraints, and choose the best path forward. 

The deliverable for this challenge is a walkie-talkie app, where users may receive short “voice messages” to one another. Because we expect this app will be used frequently, please allow for a robust history page where users can see, and listen to all of their past communications. If a user is an admin, that user may view all messages. While walkie talkies normally have both “outgoing” and “incoming” functionality, please skip any “outgoing” functionality (i.e. POSTs). 

In addition, please add a “search” feature, to allow users to find specific messages, or sets of messages. To assist with this, we’ve created a [small repository](https://github.com/fluentstream-sandbox/walkie_talkie_backend), which you can use as your mock backend. You’ll find all the endpoints you should need in that repository. 

For iOS, please use the Build Target version of 14.4. On the history page, please implement functionality for the list to refresh when the list is pulled down. Any “View” code should be completed in SwiftUI.

While they’re not mission critical objectives, bonus points for considerations for accessibility, device sizes, and a consistent color/theme. 

There is no right or wrong deliverable, and no magic “correct” solution we are looking for.  We are trying to simulate our real remote work development environment, so you can get an idea of how we work, and we can get the same from you. 
We are interested in how you communicate remotely, solicit feedback, drive discussion, think about problems, handle areas you don’t know well, and how you think about/work through design decisions.
The skills we are assessing in this process are:
* Async Communication
* Research / Design
* Coding
* Autonomy / Ownership
* Expectation Management
* Customer/Product Focus
* Attention To Detail

Please track the effort you invest in this and keep us updated. We know this is not full time, and a significant hurdle to ask of many people - so it is useful to know how much time you have spent on it. We would expect this to take a few days of wall-clock time (ideally no more than a week), and a few hours of CPU time. As we are also very busy, there will no doubt be delays on both sides as we work on this together.  Please set expectations as you would in your job!
Finally, once you have finished this and worked through it with an engineer, you’ll present the project to us in a Zoom group call.

<br />

## Screenshots

![Chat View](https://kylemusco.github.io/img/FluentStream/Chats%20View.png)   ![Message View](https://kylemusco.github.io/img/FluentStream/Message%20View.png)

<br />

## Presentation

A breakdown of design choices and future improvements can be found [here](https://docs.google.com/presentation/d/1YAKB6Lz6sSe5KtrxZc4SeHKvPoy_otVbvjWxsr-8VK4/edit?usp=sharing)
