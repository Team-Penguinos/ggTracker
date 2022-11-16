Original App Design Project - Group 2
===

# ggTracker
An iOS app to track your gaming habits.

## Table of Contents
1. [Overview](#Overview)
2. [Product Spec](#Product-Spec)
3. [Wireframes](#Wireframes)
4. [Schema](#Schema)
5. [Sprint 1](#Sprint-1)
6. [Sprint 2](#Sprint-2)
7. [Sprint 3](#Sprint-3)
8. [Sprint 4](#Sprint-4)

## Overview
### Description
Our application, GGTracker, allows users to track their video game catalog as well as track their progress through completing different video games. Users will be able to give the game a rating based on their experience through a playthrough through the game. 

### App Evaluation

- **Category:** Video Games / Social Networking
- **Mobile:** Our application would be primarily designed for mobile use, specifically iOS. We would try to abstract the functionality to keep the code relatively the same if a different type of application for ggTracker was to be created in the future.
- **Story:** ggTracker allows users to track the video games that they have played or are currently playing in a simplistic, easy way.
- **Market:** Our application would target users that enjoy and play video games. We aim to have our app be an app that users come back to frequently as they continue to play through new trending games. 
- **Habit:** The application would encourage users to maintain their video game list, but it would be up to the user to keep their list maintained.
- **Scope:** The app would be be applicable to individual users so that they could manage their played games. This could then evolve into a larger social network where users can find like minded individuals. Our app could eventually be used by TwitchTV or other game publishers to promote a product.

## Product Spec

### 1. User Stories (Required and Optional)
*Each user story is broken up into subcomponents, which will be checked off after each sprint.*

**Required Must-have Stories**

---
* **User sees an app icon on the home screen and a styled launch screen.**
    * [ ] User can see the ggTracker app icon.
    * [ ] User can see the ggTracker launch screen.
* **User can login.**
    * [ ] User can access the login screen. 
    * [ ] User can see a sign in button. 
    * [ ] User can see a sign up botton. 
* **User can logout.**
    * [ ] User will be logged out when they click the logout button.
* **User stays logged in across restarts.**
    * [ ] User has persistence between logins.
* **User can view and scroll through a list of top games on the discover page.**
    * [ ] User can see a CollectionView where games will be.
    * [ ] User can tap on a game poster on the CollectionView to view the details for the game on the details screen. 
    * [x] On the details screen, user can see an ImageView for the game poster.
    * [x] On the details screen, user has a button to add the game to user's wish list.
    * [x] On the details screen, user has a button to add the game to the user's home screen.
    * [x] On the details screen, user can see an area for the game description.
    * [ ] On the details screen, user can go back to the discover screen.
* **User can add a game to their home page.**
    * [x] User should be able to see a TableView with rows for their games.
    * [x] Users must be able to see the area with the status for their games.
    * [x] Users must be able to see the area with the hours played for their games.
    * [x] Users must be able to see the area with their rating for their games.
    * [x] Users must be able to see and click on an edit button that brings them to a screen that allows them to edit their game information. 
    * [x] Users must be able to see a settings button in the nav bar.
* **User can edit their hours, rating, and status for games added to their home page.**
    * [x] User can access the edit screen.
    * [ ] User can view the game in the edit screen.
    * [ ] User can edit the status for their games in the edit screen.
    * [ ] User can edit their hours played for their games in the edit screen.
    * [ ] User can edit the status for their games in the edit screen.
* **User can view the creators of the app.**
    * [ ] User can tap on settings icon and be brought to the about screen.
    * [x] User can see the Team Penguinos icon.
    * [x] User can view team members' names.

**Optional Nice-to-have Stories**

---
* **User can search for games on the discover page using a search bar.**
* **User can view the details for a particular game on the discover page.**
* **User can wishlist a game.**
* **User can view all of their wishlisted games.** 
* **User can change default settings in a settings area.**
* **User can leave a note on games from their home page.** 
* **User can login with Google, Twitter, and/or Facebook.** 

**Other App Requirements**

---
* **IGDB Game Database API**
    * [x] Secret key must be generated. 
    * [x] Get the game details for a list of top games. 
    * [x] Get the game names for a list of top games.
* **Parse**
    * [x] Parse must be set up.

### 2. Screen Archetypes

* **Login/Register Screen**
   * Users are able to sign up or log into their account.
   * When opening the application for the first time, the user is prompted to log in to their profile in order view the list of available games.

* **Discover Screen**
    * Users are able to view the available list of games that are available to add to their collection. 
    * Shows the cover art for each game. 
    * Users are able to add the game to their home screen or wishlist.

* **Home Screen**
    * Contains the list of the games that the user has added to their list of played games. 
    * Displays the game activity, amount of logged hours, and the user's rating for the game. 

* **Game Details (Optional Screen) Screen**
    * Shows a particular game's cover art and synopsis to the user if they click that game on the discover page. 
    * Allows the user to add the game to their home screen (or wishlist, if that optional story is implemented).

* **Edit Game Screen**
    * Allows the user to edit their hours, rating, and status for a given game listed on their home page.

* **Wishlist (Optional Screen) Screen**
    * Shows the list of the games that the user would like to play at some point in the future. 
    * Displays the cover art for the game displayed.

* **About Screen**
    * Shows the user information about the team that has developed the application. 

### 3. Navigation

**Tab Navigation** (Tab to Screen)

* Discover
* Home
* Wishlist

**Flow Navigation** (Screen to Screen)

* Login/Register Screen -> Home Screen (if the user is successfully logged into their account or has registered a new account)
* Discover Tab -> Games Details Screen
* Wishlist -> Games Details Screen
* Discover Tab/Wishlist/Home Screen -> About Screen
* Home Screen -> Edit Game Details Fields

## Wireframes
* Hand-Sketched Wireframe
<img src="ggTracker Physical Wireframe.png" width="800">

### [BONUS] Digital Wireframes & Mockups
* Digital Wireframe
<img src="ggTracker Digital Wireframe.png" width="800">
To see all of the individual frames of the digital wireframe more clearly, please navigate to the "ggTracker Digital Wireframe Individual Frames Compressed File.pdf" file.


## Schema 
### Models

   
#### Users
*This is for the users of the system.*
   | Property      | Type     | Description |
   | ------------- | -------- | ------------|
   | Username      | String   | User's username|
   | Password      | String   | User's password |
   
   
#### Favorites
*This is for the games listed on a user's home page.*
 
   | Property      | Type     | Description |
   | ------------- | -------- | ------------|
   | UserID      | ID   | Reference to the Users table|
   | GameID        | ID   | Used to get the games information from the API call|
   | Status     | Integer   | Distinguish between the games different states  |
   | UserRating     | Integer   | User's rating for the game |
   | UserHours      | Integer   | User's hours for the game |
   
   
#### Wishlist (Optional)
*This is for the games listed on a user's wishlist.*
 
   | Property      | Type     | Description |
   | ------------- | -------- | ------------|
   | UserID        | ID       | Reference to the Users table|
   | GameID        | ID       | Used to get the games information from the API call|



### Networking
#### List of network requests by screen
   - **Home Screen**
      - (Read/GET) Query all games in the userHomeList
      - (Delete) Delete a game from the userHomeList
   - **Edit Screen**
      - (Update/POST) Update status of the game
      - (Update/POST) Update user rating of the game
      - (Update/POST) Update hours played of game
   - **Discover Screen**
      - (Read/GET) Get list of top games from IGDB database
        ```swift
        func getTopGames()  {
        requestAccessToken { accessToken in
            let wrapper: IGDBWrapper = IGDBWrapper(clientID: self.clientID, accessToken: accessToken)
            
            let apicalypse = APICalypse()
                .fields(fields: "name, rating, summary, release_dates, cover")
                .limit(value: 100)
                .sort(field: "rating", order: .DESCENDING)
                .where(query: "rating > 95")
            
            wrapper.jsonGames(apiCalypse: apicalypse) { games in
                print("\(games)")
            } errorResponse: { error in
                print("\(error)")
            }
        }
         ```
   - **Details Screen**
      - (Read/GET) Query IGDB database for game details
      - (Create/POST) Add a game to userHomeList
      - (Create/POST) Add a game to userWishlist (optional)
   - **Wishlist Screen** (Optional Screen)
      - (Read/GET) Query all games in the userWishlist (optional)
      - (Delete) Delete a game from the userWishlist (optional)


### ENDPOINTS

   | Property      | Type     | Description |
   | ------------- | -------- | ------------|
   | name          | String   | Name of the game|
   | rating        | Double   | Rating of the game |
   | status        | String   | Status of the game |
   | cover         | String   | URL to poster image |
   | summary       | String   | Description of the game |
   | release date  | ID       | ID referring to release date |



##### IGDB Game Database API
- Base URL - [https://api-docs.igdb.com/v4/games](https://api-docs.igdb.com/v4/games)

   HTTP Verb | Endpoint | Description
   ----------|----------|------------
    `GET`    | /name | Name of game
    `GET`    | /rating| Average IGDB user rating
    `GET`    | /summary   | A description of the game
    `GET`    | /release_dates | Release dates of this game
    `GET`    | /cover | Reference ID for cover

## Sprint 1
### Progress Descriptions & GIFs
*For this sprint, the team worked on setting ourselves up for success early on. The group worked on getting data from the IGDB game database API, setting up the Parse server, and getting the UI, outlets, and associated files created/completed for the screens.*

---

#### Paulina DeVito
* I worked on creating the UI home screen, where users will see their personal list of games.
    * List of things I accomplished:
        * Created the table view, which has a cell for each game that a user has added to their home screen
        * Made each table view cell have rounded edges and margins for padding
        * Customized background and table cell colors 
        * Added an image view to the prototype cell for the game poster, which I will be fetching from Parse in the upcoming sprint
        * Added labels to the prototype cell to show a particular game's status, hours played, and user rating
        * Created a settings icon at the top of the view, which will be used to navigate to the settings page
* I also created the edit screen. I will be continuing the edit screen in the upcoming sprint. 
* Lastly, I have been helping manage the GitHub Project Board, especially the issues.
<img src="sprint-1-gifs/DeVito-Sprint-1.gif" height="500" width="300">

---

#### Siobahn Devlin
* I worked primarily on getting the backend set up to talk to the IGDB API. I also set up the GitHub Project Board and manage the builds and branches. 
    * List of things I accomplished:
        * Set up initial main branch and sub branches
        * Set up the IGDB API and dependencies for the project
        * Set up the GitHub Project Board (Paulina helped majorly with this)
        * Wrote function to get the access token for each request
        * Wrote function to get the list of top ten games based off of rating
        * Wrote function to convert JSON data into a Swift object called Game
        * Wrote the data model for a game
        * Helped deal with environment and build issues for team members getting set up with the project
<img src="sprint-1-gifs/Devlin-Sprint-1.gif">

---

#### Kirk Shields
* I worked on creating the database for Parse and began to create the view that would be shown to the user for adding a game to either their home screen or favorites.
    * List of things I accomplished:
        * Set up the database and Parse tables for the game information
        * Created the game details view, which shows the information about the game to the user
        * Created the controls that will add a game to the user's home screen or favorites
        * Created the image view for the game's cover art
        * Created a function that will give me specific game details from the API
<img src="sprint-1-gifs/Shields-Sprint-1.gif" width="800">

---

#### Kyle Deveaux
* 

<img src="sprint-1-gifs/Deveaux-Sprint-1.gif" width="800">
