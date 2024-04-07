------------------------------------------------------------
1.Create Database and connect to it
------------------------------------------------------------
psql --username=freecodecamp --dbname=postgres;

CREATE DATABASE number_guess;

\c number_guess

------------------------------------------------------------
2. Create tables as required conditions
------------------------------------------------------------

CREATE TABLE users(
  user_id SERIAL NOT NULL, 
  username VARCHAR(22) NOT NULL UNIQUE 
);

CREATE TABLE games(
  games_id SERIAL NOT NULL, 
  user_id INT NOT NULL, 
  guesses INT NOT NULL DEFAULT(0)
);
------------------------------------------------------------
3. Primary Key and Foreign Key assignment
------------------------------------------------------------
ALTER TABLE users ADD PRIMARY KEY (user_id);
ALTER TABLE games ADD PRIMARY KEY (games_id);
ALTER TABLE games ADD FOREIGN KEY(user_id) REFERENCES users(user_id);

------------------------------------------------------------
4. Create a folder and a file inside it
------------------------------------------------------------
mkdir number_guessing_game
cd number_guessing_game
touch number_guess.sh

------------------------------------------------------------
5.Give executable permission to shell scipt files
------------------------------------------------------------
chmod +x number_guess.sh

------------------------------------------------------------
6.Turn the folder to git repository
------------------------------------------------------------
git init

------------------------------------------------------------
7.Create a main branch and switch to it in the repository
------------------------------------------------------------
git checkout -b main

------------------------------------------------------------
8.Add the changes to staging and commit it
------------------------------------------------------------
git add .
git commit -m "Initial commit"

------------------------------------------------------------
6.Copy & Run shell script files (NOTE : insert data first)
------------------------------------------------------------
./number_guess.sh
