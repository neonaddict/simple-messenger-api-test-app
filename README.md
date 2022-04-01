# Simple Messenger API Test App

Ruby Version: 3.0.3
Ruby on Rails Version: 6.1.5

## Requirements:
* Ruby v3.0.3
* PostgreSQL DB
* Ruby on Rails v6.1.5
## Development
1. Make sure you can connect to PostgreSQL. At least `CREATE TABLE` priveleges are required.
2. Clone repo
    ```
    $ git clone https://github.com/neonaddict/simple-messenger-api-test-app.git
    ```
3. Install gems
    ```
    $ bundle install
    ```
4. Setup databases with seeds
    ```
    $ rails db:setup
    ```
 5. To launch app, run:
     ```
     $ rails s
     ```
     You can access api now with base URL `http://localhost:3000`
