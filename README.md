
> *Project status:* completed </br>
> *:busts_in_silhouette: Author:* Mário Augusto Carvalho Lara Leite </br>
> *:email: Email:* tkyakow@gmail.com  </br>
> :date: *Year:* 2021

# Case:
**Create a basic Rails application using a SQL database. The application should provide a user model that incorporates elements such as a unique user 'handle' (their username), password and a login failure count. Provide a HTML based UI that provides for a user login (users can be created via direct access to the database only, no need for a user sign up). Upon successful completion, the user will be presented with a basic log out option (nothing fancy needed here) so that the process can be attempted repeatedly. The code should account for login failures and lock the user account (i.e. prevent further log in) after 3 consecutive fails (reset the failure count upon a successful login). Include unit tests for the models and controllers created. Do not use libraries or features that already encapsulate a lot of this process (e.g. devise or has_secure_password). Once you're happy with what you have, zip up the Rails directory and provide that to us for assessment.**

# Versions:
> Ruby: 2.7.2p137 (2020-10-01 revision 5445e04352) [x86_64-linux]

> Rails: Rails 6.1.3.2

# Database:
> PostegreSQL

# Executing the app:
> Go to repository ([https://github.com/ofamosomario/pocket-health])(https://github.com/ofamosomario/pocket-health) and clone the project.

> rake db:create db:migrate db:seed

> rails s to execute the rails.

# Heroku:

> ([https://pocket-health.herokuapp.com/])(https://pocket-health.herokuapp.com/)

# Tests
> Run in terminal: rspec

> username: test1, email: test1@gmail.com, password: 123123, password_confirmation: 123123

> username: test2, email: test2@gmail.com, password: 123123, password_confirmation: 123123

> username: test3, email: test3@gmail.com, password: 123123, password_confirmation: 123123

# RuboCop

![RUBOCOP!](https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTvMSFQaCKg10EWCRxKz6sQWiTpHbiMdqjbGA&usqp=CAU)

> Run in terminal: rubocop

**Thank you!**