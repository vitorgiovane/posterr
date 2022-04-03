<p align="center" style="margin-top: 50px">
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
5. To populate the database with some sample data for users, posts and followers, run: `docker-compose run ruby rake db:seed`.
6. Now, access the API documentation, click on the button located on the top right Run in Postman and start consuming the API. endpoints. API documentation is located at:
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

## 📋 License
This project is under the MIT license. See LICENSE at project root for more information.

<br>

---
Developed by **Vitor Giovane** <span>&#x1f1e7;&#x1f1f7;</span>

**[Talk to me 😁👍](https://www.linkedin.com/in/vitorgiovane)** 