## Description
🎭  We’re going to make a simple mood tracker to help us learn MVVM.

<img src="./Screenshots/mood tracker.gif" alt="basic mood tracker" height="500px">

## My Version and User Story

1. User opens app to see place to add check-in and list of previous check-ins (if there are any)
2. User types their mood into the textfield and presses save
3. That check-in is added to beginning of the list of previous check-ins

## What Does Success Look Like?

- Your view code does very minimal work and is very simple
- Model: You have created a mood check-in `struct` that:
    - Conforms to the `Identifiable` protocol
    - Contains a `mood` property of type `String`
    - Contains a `timestamp` property of type `Date`
    - Contains a `formattedTimestamp` property of type String
- View Model: You have created a `MoodTrackerViewModel` that:
    - Conforms to the `ObservableObject` protocol
    - Contains an `@Published` array of mood check-ins
    - Contains an `@Published` string that holds the new title of a check-in (bound to textfield)
    - Contains a method to create and save a new check-in where the timestamp is the current time (`Date()`)
- View: Your `ContentView` has:
    - An `@StateObject private` property that holds your View Model
    - A `TextField` to type in the mood for a new check-in
    - A `Button` that calls the creation method in your View Model
    - A ForEach over your View Model’s check-ins array
        - Bonus points if you can make it in reverse chronological order
        - Hint: its order is *reversed* from the default order if you just append new items

## Goal
- This project will help us learn the basic idea of MVVM where we separate our business logic from our View code

## Installation Instructions

1. Make sure you’ve forked and cloned the https://github.com/appteamcarolina/apprentice-projects-s22.git repository
2. Visit your forked version of the repo on the GitHub website.

    `https://github.com/<# your GitHub username #>/apprentice-projects-s22`

3. Fetch and Merge the latest changes.
4. Pull those changes into your local version of the repository.
