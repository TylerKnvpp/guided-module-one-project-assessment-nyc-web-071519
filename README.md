<p align="center">
  <img width="400" height="171" src="public/assets/datenight_logo_readme.png">
</p>

Dates can be stressful. Let Datenight™️ pick the restaurant so you can focus on your date.

Datenight™️ is a CLI application that returns a randomly selected, highly rated restaurant within a neighborhood or location of your choice. Create an account, enter a location + date and pick from one of Datenight's suggestions.

Datenight™️ V1 Features:

1. Create a Date
2. View Information on Upcoming Dates
3. View Information on Past Dates

To get started, fork this repository, copy the clone/download link and head over to your terminal and enter the following commands.

```
git clone [forked-repository-url]
cd [forked-repository-url]`
bundle install
```

For the app to work, you will need to create a Yelp account so that you can generate a Yelp API Key. To do so, sign in or create an account with Yelp then head over to this link.

https://www.yelp.com/developers/v3/manage_app

Once you complete the form, you will be sent an email with your new Yelp API Key. Head over to your text editor and open the .env file and enter the API key in the following format.

```
YELP_API_KEY=[generated-api-key]
```

You're ready for Datenight! Now just run the following command in your terminal and follow the instructions within the application.

```
ruby ./bin/run.rb
```

Oh, and shoot for the stars 💫
