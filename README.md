<h4 align="center" style="margin-top: 25px">
  Developed by <b>Vitor Giovane</b> <span>&#x1f1e7;&#x1f1f7;</span>

**[Talk to me 😁👍](https://www.linkedin.com/in/vitorgiovane)** 
</h2>
<p align="center">
  <br>
  <img height="120px" alt="Company logo" src="https://res.cloudinary.com/vitorgiovane/image/upload/v1648955956/posterr/posterr_ctr2gx.png" />
</p>
<br>
<h2 align="center">
  Back-end of Posterr application
</h2>
<h4 align="center" style="margin-bottom: 20px">REST API developed with Ruby on Rails</h4>

<p align="center">
  <img alt="Ruby" src="https://img.shields.io/badge/Ruby-CC342D?style=for-the-badge&logo=ruby&logoColor=white">
  <img alt="Rails" src="https://img.shields.io/badge/Ruby_on_Rails-CC0000?style=for-the-badge&logo=ruby-on-rails&logoColor=white">
  <img alt="Postgres" src="https://img.shields.io/badge/PostgreSQL-316192?style=for-the-badge&logo=postgresql&logoColor=white">
</p>

<br>

## 💎 Features
- Listing of posts
- Creation of posts, reposts and quote posts
- User details visualization
- Follow and unfollow users
- Filtering posts based on followed users

<br>

## 📑 API documentation
### https://documenter.getpostman.com/view/3822165/UVyswvMg

<br>

## 🔳 Entity Relationship Diagram
<img alt="Entity Relationship Diagram" src="https://res.cloudinary.com/vitorgiovane/image/upload/v1648957562/posterr/posterr_erd_diagram_bpp0qy.jpg"> 

<br>

## 📝 How this project was planned
I divided this project into multiple tasks.
To plan and manage the tasks of this project, I created a board in Trello and adopted the Kanban methodology. Each task is associated with a card in Trello and has 3 tags: the first for the context, the second for the task type and the last for the priority level. I adopted an identifier code for each card. And each commit contains, among other information, the code related to the task it is associated with. The Trello board is public and can be accessed at:
- https://trello.com/b/kit5W19m/pos-posterr

<br>

## 🎮 How to run this project
1. Clone this repository on your machine.
2. Make sure you have Docker and Docker Compose installed on your machine.
3. At the root of the project, create an `.env` file and fill it in according to the `.env.example` file. Filling example:
   ```yml
   PROJECT_PREFIX=posterr-api

   API_EXTERNAL_PORT=5010

   DATABASE_HOST=postgres
   DATABASE_EXTERNAL_PORT=5020
   DATABASE_NAME=posterr
   DATABASE_USER=posterr
   DATABASE_PASSWORD=posterr

   DATABASE_TEST_EXTERNAL_PORT=5030

   USER_ID=${id -u}
   GROUP_ID=${id -g}
   ```
4. In a terminal at the root of the project run `docker-compose up -d --build` to build an run the containers.
5. After, run `docker-compose run ruby rake db:migrate` to execute the pending migrations and update database.
6. To populate the database with some sample data for users, posts and followers, run: `docker-compose run ruby rake db:seed`.
7. The API should now be available on the port defined in the API_EXTERNAL_PORT variable in the `.env`. If your .env is similar to `.env.example`, the API should be accessible at: `http://localhost:5010`.
8. Access the API documentation, click on the button located on the top right Run in Postman and start consuming the API endpoints. API documentation is located at:
   - https://documenter.getpostman.com/view/3822165/UVyswvMg.

<br>

## 🧪 How to run automated tests
1. Make sure you have the containers built and running. Otherwise, run: `docker-compose up -d --build`.
2. In a terminal at the root of the project run `docker-compose run ruby rake test` to run all tests.

<br>

## 🚀 Technologies
This project was developed with the following technologies:

- Ruby ________________ 3.1.1
- Rails ________________ 7.0.2.3
- Postgres ____________ 14.2
- Docker ______________ 20.10.12
- Docker Compose ___ 1.29.2
- Postman ____________ 9.15.10
- VS Code _____________ 1.66.0
- Git ___________________ 2.35.1

<br>

## 🔷 Planning

### Questions about implementation
- What is the character limit for each reply?
- Will there be any daily replies limit per user, as there is for posts?
- Will there be pagination for the replies? If yes, how many replies should be displayed at a time?
- Is there a possibility of interaction with a reply? That is, can any user make a reply of a reply?
- As with the homepage, will a user be able to filter replies only from who they follow?
- What will be the order in which the replies are displayed? Is this ordering fixed or can the user reorder by other criteria?
### How would i solve this problem

It will be necessary to create a specific table in the database for the replies, the name of this table will be "replies". This table will have, in addition to the column for the content of the reply, two foreign keys: one with the users table, to identify the author of the reply, and another with the posts table, to identify which post the reply belongs to. The relationship of the replies table with the users table will be from N to 1 respectively, since a user can have multiple replies, but a reply only belongs to one user. The ratio of the replies table to the posts table will be 1 to 1.

As I applied TDD in this project, I would start the implementation of this functionality by creating unit tests for the Reply model and integration tests for the PostsController controller, since the replies would be associated with a post, which eliminates the existence of a specific controller for the replies.

It would be necessary to create a validator class for the replies, ReplyValidator. Assuming that there will be a character limit per reply and a limit of daily replies I will create two validations in the ReplyValidator and include this class in Reply model class.

If the reply of reply is possible, it would be necessary to create a relationship between the replies table and itself, establishing a parent_id primary key that would store the id of the reply to which the new reply refers.

You will need to change the current post listing endpoint, located in the index method of the PostsController. This endpoint will now accept a parameter named include_replies. When this parameter is passed with the value "true", the replies will be included in each post. A reply serialization file will be created and the post serialization file will be changed to include an array of replies.

If it is desired to filter replies by only who is followed, when I receive the parameter "only_the_followed" in the request, I will apply a scope previously defined in the Reply model class, which will filter the replies from the users followed by the current user.

<br>

## 🔷 Critique

### What would i improve if i had more time
- Would create a robust logging system. It would be very useful to analyze problems that occurred in the production environment.
- I would create services classes to perform each single operation, such as creating a post. This would allow me to take the record creation logic out of the controllers.
- I would adopt a linter to adopt a code writing pattern for the entire development team involved in the project.
- I would add Redis to cache the content of the most repeated queries.

<br>

### Scaling
If this project grew and had many users and posts, surely the database would be the first to fail. As this application does not do high data processing, nor file manipulation, there would not be a problem of processing or storing data first. For that reason, to scale this product I would initially think about creating a caching scheme by adding Redis. It would search for the most repeated queries and cache content that doesn't need so much revalidation. As is the case with current user details, these are data that do not change constantly. At a future time, I would consider dividing the application into microservices. Separating user handling from post handling.

<br>

## 📋 License
This project is under the MIT license. See LICENSE at project root for more information.

<br>

---
Developed by **Vitor Giovane** <span>&#x1f1e7;&#x1f1f7;</span>

**[Talk to me 😁👍](https://www.linkedin.com/in/vitorgiovane)** 