# The Pantry

The pantry allows the user to track their inventory, it has been designed for shops which sale items by weight or units.
The pantry is a full stack application which uses Ruby, Sinatra framework and PostgreSQL Database.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development purposes.

### Installing

You need to install sinatra:

```
 gem install sinatra sinatra-contrib
```
You also need psql installed. You can get it here:

```
https://www.postgresql.org/download/macosx/
```
Ensure that the postgresapp is installed and running

Run a psql:

```
psql
```

Create a db:

```
createdb shop_inventory
```

Create the tables:

```
psql -d shop_inventory -f db/shop_inventory.sql
```

Seed the database:

```
ruby db/seeds.rb
```

Run the app:

```
ruby app.rb
```

#### Using

The application is running on port 4567 so visit http://localhost:4567.


##### Images of the app  

