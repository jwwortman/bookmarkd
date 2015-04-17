== User manual

This project runs off of a PostgreSQL database. Make sure that PostgreSQL and pgAdmin III is downloaded onto your computer before starting.

* Extract .zip file from the CD

* In pgAdmin III, create a New Login Role...

* Under the Properties tab, set the Role name field to 'bookmarkd'

* Under the Definition tab, set the Password and Password (again) fields to 'bookmarkd'

* Under the Role privileges tab, make sure that the Superuser checkbox is checked and click OK

* <tt>rake db:setup</tt> (make sure you are in the extracted project folder)

* <tt>rails s</tt>

* Open <tt>localhost:3000</tt> to interact with the application

