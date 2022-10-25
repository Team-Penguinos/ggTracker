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
[Add picture of your hand sketched wireframes in this section]
* Hand skethed wireframe
<img src="ggTracker Physical Wireframe.png" width="300">


### [BONUS] Digital Wireframes & Mockups
* Digital Wireframe
<img src="ggTracker Digital Wireframe.png" width="300">

### [BONUS] Interactive Prototype

## Schema 
[This section will be completed in Unit 9]
### Models
[Add table of models]
### Networking
- [Add list of network requests by screen ]
- [Create basic snippets for each Parse network request]
- [OPTIONAL: List endpoints if using existing API such as Yelp]
