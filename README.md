![The Pulse Logo](app/assets/images/logo_1.png)

## Have you ever moved to a new city and found yourself lost? Or simply looking for new experiences and want to meet people?

### The Pulse is the answer!

Discover local events and meet people through The Pulse. Feel the heartbeat of London.

[>>> Live website <<<](https://the-pulse.herokuapp.com/)

![Main Page](/app/assets/images/main-page.png "Main Page")
<table>
  <tr>
    <td><img src="app/assets/images/events-index.png" ></td>
    <td><img src="/app/assets/images/event-show.png" ></td>
    <td><img src="/app/assets/images/users-index.png" ></td>
    <td><img src="/app/assets/images/user-show.png" ></td>
  </tr>
</table>

## Getting Started
### Setup

Install gems
```
bundle install
```
Install JS packages
```
yarn install
```

### ENV Variables
Create `.env` file
```
touch .env
```
Inside `.env`, set this variable.
```
CLOUDINARY_URL=your_own_cloudinary_url_key
```

### DB Setup
```
rails db:create
rails db:migrate
rails db:seed
```

### Run a server
```
rails s
```

### Log in as testing@testing.com
### Password: testing

## Enjoy!!

---

## Dev log

### Built With
- [Rails 6](https://guides.rubyonrails.org/) - Backend / Front-end
- [JavaScript](https://www.javascript.com/) - Front-end JS
- [Heroku](https://heroku.com/) - Deployment
- [PostgreSQL](https://www.postgresql.org/) - Database
- [Bootstrap](https://getbootstrap.com/) — Styling
- [Figma](https://www.figma.com) — Prototyping


<h3 align="center">Languages and Tools:</h3>
<p align="center">
<a href="https://www.ruby-lang.org/en/" target="_blank" rel="noreferrer"> <img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/ruby/ruby-original.svg" alt="ruby" width="40" height="40"/> </a>
<a href="https://rubyonrails.org" target="_blank" rel="noreferrer"> <img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/rails/rails-original-wordmark.svg" alt="rails" width="40" height="40"/> </a>
<a href="https://www.postgresql.org" target="_blank" rel="noreferrer"> <img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/postgresql/postgresql-original-wordmark.svg" alt="postgresql" width="40" height="40"/> </a>
<a href="https://developer.mozilla.org/en-US/docs/Web/JavaScript" target="_blank" rel="noreferrer"> <img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/javascript/javascript-original.svg" alt="javascript" width="40" height="40"/> </a>
<a href="https://www.w3.org/html/" target="_blank" rel="noreferrer"> <img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/html5/html5-original-wordmark.svg" alt="html5" width="40" height="40"/> </a>
<a href="https://www.w3schools.com/css/" target="_blank" rel="noreferrer"> <img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/css3/css3-original-wordmark.svg" alt="css3" width="40" height="40"/> </a>
<a href="https://getbootstrap.com" target="_blank" rel="noreferrer"> <img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/bootstrap/bootstrap-plain-wordmark.svg" alt="bootstrap" width="40" height="40"/> </a>
<a href="https://git-scm.com/" target="_blank" rel="noreferrer"> <img src="https://www.vectorlogo.zone/logos/git-scm/git-scm-icon.svg" alt="git" width="40" height="40"/> </a> <a href="https://heroku.com" target="_blank" rel="noreferrer"> <img src="https://www.vectorlogo.zone/logos/heroku/heroku-icon.svg" alt="heroku" width="40" height="40"/> </a>
<a href="https://www.figma.com/" target="_blank" rel="noreferrer"> <img src="https://www.vectorlogo.zone/logos/figma/figma-icon.svg" alt="figma" width="40" height="40"/> </a>
<a href="https://www.linux.org/" target="_blank" rel="noreferrer"> <img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/linux/linux-original.svg" alt="linux" width="40" height="40"/> </a> <a href="https://www.photoshop.com/en" target="_blank" rel="noreferrer"> <img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/photoshop/photoshop-line.svg" alt="photoshop" width="40" height="40"/> </a>
</p>


## Back End
Application consist of four models:
- User
  - The entire User logic was created using [DEVISE](https://github.com/heartcombo/devise)
  - Authentication logic
  - One to many reference with Events, Groups and Reviews
  - Photo attachment using [Cloudinary](https://cloudinary.com/) as active_storage
- Event
  - Backbone of the aplication
  - All CRUD actions
  - One to many with booking and Reviews, many to many with Users through Bookings.
  - Photo attachment using [Cloudinary](https://cloudinary.com/) as active_storage
- Group
  - A mid-man bet
- Invite
  - User can either add yourself to the even or invite someone else straight to the event.
  - Each user story has different routes and path and its carrying different sets of params throughout all the views.
- Location
  - Contains geolocated data of a venue for each Event.
- Favorite
  - Allows to save Events and Users as favorites by Users.
- Booking
  - Many to many between User and Group.
- Review
  - Reference to User and Event, nested in Event routes.
  - Each User and Event can get a Review.

## Contributing
Any pull requests are welcome. For any major changes, please open an issue first to discuss what you would like to change.

## License
This project is licensed under the MIT License.
