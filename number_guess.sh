#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"
echo -e "Enter your username:\n"
read USER_NAME
EXISTING_USER=$($PSQL "SELECT username FROM users WHERE username='$USER_NAME'")
GAMES_PLAYED=$($PSQL "SELECT COUNT(*) FROM users INNER JOIN games USING(user_id) WHERE username='$USER_NAME'")
BEST_GAME=$($PSQL "SELECT MIN(guesses) FROM users INNER JOIN games USING(user_id) WHERE username='$USER_NAME'")
if [[ -z $EXISTING_USER ]]
then
  INSERT_USER=$($PSQL "INSERT INTO users(username) VALUES('$USER_NAME')")
  echo "Welcome, $USER_NAME! It looks like this is your first time here."
else
  echo "Welcome back, $USER_NAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

RANDOM_NUMBER=$(( $RANDOM % 1000 + 1 ))
echo $RANDOM_NUMBER
GUESS=1
echo  "Guess the secret number between 1 and 1000:"
while read NUM
do
  if [[ ! $NUM =~ ^[0-9]+$ ]]
  then 
    echo "That is not an integer, guess again:"
  else
    if [[ $NUM -eq $RANDOM_NUMBER ]]
    then 
      break;
    else
      if [[ $NUM -gt $RANDOM_NUMBER ]]
      then
        echo "It's lower than that, guess again:"
      elif [[ $NUM -lt $RANDOM_NUMBER ]]
      then
        echo "It's higher than that, guess again:"
      fi
    fi
  fi
  GUESS=$(( $GUESS + 1 ))
done
if [[ $GUESS == 1 ]]
then
  echo "You guessed it in $GUESS tries. The secret number was $RANDOM_NUMBER. Nice job!"
else
  echo "You guessed it in $GUESS tries. The secret number was $RANDOM_NUMBER. Nice job!"
fi

USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USER_NAME'")
INSERT_GAME=$($PSQL "INSERT INTO games(user_id, guesses) VALUES($USER_ID, $GUESS)")


