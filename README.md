== User manual

This project uses a PostgreSQL database. Make sure that PostgreSQL and pgAdmin III are set up on your computer before beginning.

* Extract .zip file from the CD

* In pgAdmin III, create a New Login Role...

* Under the Properties tab, set the Role name field to 'bookmarkd'

* Under the Definition tab, set the Password and Password (again) fields to 'bookmarkd'

* Under the Role privileges tab, make sure that the Superuser checkbox is checked and click OK

* rake db:setup (make sure you are in the extracted project folder)

* rails s

* Open localhost:3000 to interact with the application

