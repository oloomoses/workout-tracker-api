# Workout Tracker API

This is a Workout Tracker RESTFUL API built with Ruby on Rails. It uses JWT to implement Authentication & Authorization.
This project is part of my Full Stack web application that can help users to keep track of minutes they spend and calories burned on an exercise activity.

## Live Link
- [API Home](https://afternoon-castle-24666.herokuapp.com/)
- [Client App](https://agitated-heyrovsky-eb2953.netlify.app)

## Video Presentation
[Link to be added]()

## Built With

- Ruby v2.7.0
- Ruby on Rails v6.1.3
- RSpec-Rails for testing

## Current API Endpoints

The API will expose the following RESTful endpoints.

| Endpoint                                     | Functionality                |
|----------------------------------------------|------------------------------|
| POST /signup                                 | Signup                       |
| POST /auth/login                             | Login                        |
| GET /workouts                                | List all workouts            |
| POST /workouts                               | Add a new workouts           |
| DELETE /workouts/:id                         | Delete a workouts            |
| PUT /workouts/:id                            | Update a workouts            |
| GET /workouts/:workout_id/track_its          | Lists all trackits in workout|
| POST /workouts/:workout_id/track_its         | Add new trackit              |
| PUT /workouts/:workout_id/track_its/:id      | Update trackit               |
| DELETE /workouts/:workout_id/track_its/:id   | Delete trackit               |

## API Documentation
[Workout API to be added]()

## Getting Started

To get a local copy up and running follow these simple example steps.

### Prerequisites

Ruby: 2.7.0
Rails: 6.1.3
Postgres: >=9.5

### Setup

~~~bash
$ git clone https://github.com/oloomoses/workout-tracker-api.git
$ cd workout-tracker-api
~~~

Install gems with:

```
bundle install
```

Setup database with:

> make sure you have postgress sql installed and running on your system

```
   rails db:create
   rails db:migrate
```

### Usage

Start server with:

```
    rails server -p 3001
```

Open `http://localhost:3001/` in your browser.

### Deploy to a live server

Deploying to a live server like Heroku is easy, make sure you have the necessary credentials setup on your local machine

```bash
heroku create
heroku rename app-new-name
git push heroku $BRANCH_NAME:master 
```
if you are already in master branch no need to add $BRANCH_NAME, just use `git push heroku master`

```bash
heroku run rails db:migrate
heroku open
```

Enjoy your newly deployed rails API


### Run tests

```
    bundle exec rpsec 
```

# Authors

👤 **Oloo Moses**
- Github: [@githubhandle](https://github.com/oloomoses)
- Twitter: [@twitterhandle](https://twitter.com/olooine)
- Linkedin: [linkedin](https://www.linkedin.com/in/oloomoses/)


## Contributing

Contributions are what make the open source community such an amazing place to be learn, inspire, and create. Any contributions you make are **greatly appreciated**.

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgement
[Microverse Inc](https://www.microverse.org/)
