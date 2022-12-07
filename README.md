Original App Design Project - README Template
===

# TASTE RECIPE APP

## Table of Contents
1. [Overview](#Overview)
1. [Product Spec](#Product-Spec)
1. [Wireframes](#Wireframes)
2. [Schema](#Schema)

## Overview
### Description
Cooking is a passionate profession that transforms everyday meals into something appealing and inviting, and many people practice this art as a hobby or make it a profession. Especially in the first Covid19 phase, when the whole world was confined to their homes, food was the only thing they really connected with, so there were a lot of food photos people shared in the first two months. skill.

It was just around this time that people explored so many food recipe mobile apps and realized their usefulness. Even today, people, especially foodies, love using these apps to search for recipes for different dishes.

This app is a recipe app where people can log in and take advantage of the recipes and learn how to cook diffrent foods from around the world with the option of saving the recipes and accessing them later when needed.

### App Evaluation
[Evaluation of your app across the following attributes]

- **Category:** Health and Fitness/ recreational.

- **Mobile:** What makes this Idea unique is that it has the potential to connect people from all around the world by sharing their recipes and experiments. with the camera feature the user can share images of the final product and tell the community about their experiences.

- **Story:** Cooking is a passionate profession that transforms everyday meals into something appealing and inviting, and many people practice this art as a hobby or make it a profession. Especially in the first Covid19 phase, when the whole world was confined to their homes, food was the only thing they really connected with, so there were a lot of food photos people shared in the first two months. skill.

    It was just around this time that people explored so many food recipe mobile apps and realized their usefulness. Even today, people, especially foodies, love using these apps to search for recipes for different dishes.

- **Market:** One survey even discovered that these food recipe apps enjoy a market size of 22,755,800 potential users from the countries of Canada, the USA, India, Australia, Philippines, and Pakistan, who have searched through Facebook and showed interest in cooking. Hence, it is clear that there is no stopping in this industry.

- **Habit:** A survey states that 59% of 25- to 34-year-olds head to the kitchen with either their smartphones or tablets. There were around millions of people locked in the home during the Covid-19 pandemic and out of this 130 million people were in India. So, as the outside activities came to an end, these huge number of people found solace in activities like Cooking, Health and games. These basically were the most leisure-related topics during the peak of lockdown.

- **Scope:** In 2019, the total app revenue from recipe apps was $461.7 billion all across the world and it was estimated to generate $935.2 billion in the year 2023. And one out of each four is an iPhone or iPad user of the age 18 and older, who searched for food recipes.

## Product Spec

### 1. User Stories (Required and Optional)

**Required Must-have Stories**




| #    | As a <Type of user> | I want/ need to <perform task> | So that I can <achieve some goal> | Acceptance Criteria |
| ---- | ------------------- | ------------------------------ | --------------------------------- | ------------------- |
|#1   |     As a new Taste app user                |   I need to be able to create an account by providing email and password                             | So, I can be a part of the community who loves to cook and experiment new things in the kitchen                                  |   Ensuring the user is able to fill out the text fields with their email and password and then click submit to register.                  |
|#2  |        As a Regular Taste app user             |   I want to be able to log in and log out of the app                             | So, I can access the and explore the content available                                  |Ensuring the user can scroll up and down to explore the recipes and the content available  |


**Optional Nice-to-have Stories**



| #   | As a <Type of user> | I want/ need to <perform task> | So that I can <achieve some goal>    |  Acceptance Criteria   |
| --- | ------------------- | -------- | --- | --- |
| #1  | As a Regular Taste app user                | I want to be able post new reipes and get in touch with other users    | So, I can be a part of the community who loves to cook and experiment new things in the kitchen    | Ensuring the User can post pictures of the food and fill out the text fields to add the recipe. |
    
### Completed User Stories 
    
- [x] Created the Login page where the user can login or create an account by signing up providing the email and password.  
- [x]     created the home feed page.
- [x]     created the add new recipe page.
- [x]     created the categories page where the user can select from different categories.
- [x]     implimneted the LogIn Logout function.
- [x]     added the add recipe button and its Funtionality
- [x]     added the pages for the categories viwe (Dessert, Entres, Appetizers and Drinks).
- [x]     added the delete functionality on my recipes page.
- [x]     made the categories views functional. the user can see the pictures and title for the recipes with the steps to make it.
- [x]     Polish remaining functionality.
- [x]     Implement auto layout to all views.
- [x]     Test and debug. Create a PR for any fixes necessary.

### GIF for the completed user stories
<img src="https://media.giphy.com/media/PzqYXik7V3tA60WjB6/giphy.gif"><br>
<img src="https://media.giphy.com/media/Pl0hnRmETHRYhuJNwq/giphy.gif"><br>
<img src="https://media.giphy.com/media/DNE9t4hdbO7Zfugo8u/giphy.gif"><br>


### GIF For The Final Presentation
<img src="https://media.giphy.com/media/wC7vsYYaDDMLUdQwoB/giphy.gif"><br>

### Login Screen 
<img src="https://i.imgur.com/uIk68hI.jpg)"><br>   

### 2. Screen Archetypes

* Login Screen
   * login controller creation
* Home Screen Navigation
   * create home screen with recipes
   * add tab navigation to switch between views
* Categories tab
   * View categories of recipes to filter between
* My recipes tab
   * add recipes to db
   * view your recipes
   * delete your recipes
* Settings tab
   * TBD if necessary
   * would likely have the logout option and other possible options(delete account)


### 3. Navigation

**Tab Navigation** (Tab to Screen)

* [Home]
* [Recipes]

**Flow Navigation** (Screen to Screen)

* [Home screen]
   * [From Home Screen or Recipes screen]
   * Here users can look at announcements, newsfeeds and an overview of what the site has to offer.
   
* [Recipes screen]
    * [From Recipes screen to either Home Screen or categories screen]
    * This is a screen where users can look at different recipes that are posted on the app.

## Wireframes
<img src="https://i.imgur.com/L9WeNJu.jpg" width=800><br>

### Models 
* Post

property: Type: Description
objectId: String: This property represents the identities of every single user
which uses the app to look at different recipes and get some inspiration, as well as post their own for others to see.

author: Pointer to User: This property represents the user when they upload a photo
or description of a recipe they want to share.

photo: File: This property represents the visual representation of the
recipe the user wants to share with others.

caption: String: This property is part of an optional description the user
can add if they want with the photo of the recipe, they post for others to see.

created: DateTime: This property shows the date of
when the recipe was posted by the user.

updated: DateTime: This property shows the date of
when the recipe was last edited.


### Networking
* Login Screen
   * Built-in PFUser login functionality.
* Home Screen
   * (Read/GET) All Recipes
   ``` Swift
   let recipeQuery = PFQuery(className:"recipes")
   let recipes = recipeQuery.find()
   recipes.order(byDescending: "createdAt")
   ```
* Categories tab
   * (Read/GET) Recipes for the selected category.
   ``` Swift
   let recipeQuery = PFQuery(className:"recipes")
   recipes = recipeQuery.whereKey("category", equalTo: category)
   recipes.order(byDescending: "createdAt")
   ```
* My recipes tab
   * (Create/POST) Create a new recipe.
   ``` Swift
   let newRecipe = PFObject(className: "recipes")
   //fill in newRecipe info
   newRecipe.saveInBackground { success, error in
      if success {
         print("Saved!")
      } else {
         print("Error!")
      }
   }
   ```
   * (Delete) Delete a recipe.
   ``` Swift
   let recipe = self.whateverIsHoldRecipe
   recipe.delete()
   ```
   * (Read/GET) View your recipes.
   ``` Swift
   let recipeQuery = PFQuery(className:"recipes")
   recipes = recipeQuery.whereKey("author", equalTo: currentUser)
   recipes.order(byDescending: "createdAt")
   ```

