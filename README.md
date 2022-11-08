Original App Design Project - README Template
===

# GGTracker

## Table of Contents
1. [Overview](#Overview)
1. [Product Spec](#Product-Spec)
1. [Wireframes](#Wireframes)
2. [Schema](#Schema)

## Overview
### Description
Our application, GGTracker, allows users to track their video game catalog as well as track their progress through completing different video games. User's will be able to give the game a rating based on their experience through a playthrough through the game. 

### App Evaluation

- **Category:** Video Games / Social Networking
- **Mobile:** Our application would be primarily designed for mobile use, specifically iOS, but could be adapted for access on a web application. We would try to keep the functionality the same between different versions of applications.
- **Story:** Allows users to track the video games that they have played or are currently playing. Users will be able to share their list with other users as well as view other users lists.
- **Market:** Our application would target users that play video games. To maintain safety, video game titles of a certain age rating would only be viewable by of-age users.
- **Habit:** The application would encourage users to maintain their video game list, but it would be up to the user to keep their list maintained.
- **Scope:** First the app would be be applicable to individual users so that they could manage their played games. This could then evolve into a larger social network where users can find like minded individuals. Our app could eventually be used by TwitchTV or other game publishers to promote a product.

## Product Spec

### 1. User Stories (Required and Optional)

**Required Must-have Stories**
* User can login.
* User can logout.
* User can add a game to their game list.
* User can mark the progress they have made through a game.
* User can view their game list.
* User can view the creators of the app.

**Optional Nice-to-have Stories**

* User can search for games on the discover page using a search bar.
* User can view a details screen for each game on the discover page.
* User can wishlist a game.
* User can login with Google, Twitter, or Facebook. 

### 2. Screen Archetypes

* Login/Register - User sign up or logs into their account
   * When opening the application for the first time the user is prompted to log in to their profile in order view the list of available games.

* Discover 
    * Users are able to view the available list of games that are available to add to their collection. Shows the cover art for each game. Users are able to add the game to their home screen or wishlist.
   
* Home
    * Contains the list of the games that the user has added to their list of played games. Displays the game activity, amount of logged hours, and the user's rating for the game. 
 
* Game Details (Optional Screen)
    * When the game is selected from the Home or Discover screen, the games cover art and synopsis are shown to the user. Allows the user to add the game to their home screen or wishlist.

* Edit Game
    * Allows the user to edit the amount of hours played for a game as well as update the rating given for the game.

* Wishlist (Optional Screen)
    * Shows the list of the games that the user would like to play at some point in the future. Displays the cover art for the game displayed.

* About
    * Shows the user information about the team that has developed the application. 

### 3. Navigation

**Tab Navigation** (Tab to Screen)

* Discover
* Home
* Wishlist

**Flow Navigation** (Screen to Screen)

* Login Screen -> Account Creation if the user does not have an account
* Discover Tab -> Games details screen
* Wishlist -> Games details screen
* Discover Tab/Wishlist/Home Screen -> Settings Screen
* Home Screen -> Edit Game Details Fields

## Wireframes

![](https://i.imgur.com/JHSLuNN.png)





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

