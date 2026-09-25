# Introduction to BigQuery Sandbox

> Source: https://www.geeksforgeeks.org/devops/google-cloud-platform-introduction-to-bigquery-sandbox/

BigQuery sandbox gives you free access to try out BigQuery and use the UI without providing a credit card or using a billing account. It's a quick way to get started and try out some BigQuery concepts.
To get started, click on this link and follow along with the rest of the article. If you're a new Google Cloud user, you'll need to create an account and a project by following the prompts.
Once a project is created, you'll be redirected to the BigQuery console, where you'll see Sandbox in the top left-hand corner.
If you're a returning Google Cloud user, create a new project by selecting the Project dropdown.
Your new project may be created with a default billing account. If that's the case, go into the Billing Account Management page and select Disable Billing. Then use the search bar within the console to head to BigQuery.
Make sure your new project is selected in the Project dropdown, and there, you will also see Sandbox in the top left-hand corner. Now that you're in the BigQuery Sandbox, you're ready to start querying. That's all it takes to get set up.
Because you aren't charged for using the BigQuery Sandbox, there are a few caveats. Mainly, any tables or views that you create will expire after 60 days. You're also limited to 10 gigabytes of storage, and one terabyte of data process each month. Now you can easily start working with public data sets, loading in your own data, and running some queries.
BigQuery provides publicly available data sets for anyone to analyze covering a variety of data types, from historical weather to taxi trips taken in New York City. To analyze public data, just click on the Add Data button on the left-hand side to see a list of the publicly available data sets that you already have available.
As a quick example, let's use the project sunroof public data set, so you can see how much sunlight hits your roof in a year. For this we will be using the following query:
SELECT state_name, AVG(yearly_sunlight_kwh_kw_threshold_avg) AS average_sun
FROM 'bigquery-public-data.sunroof_solar.solar_potential_by_postal_code'
GROUP BY state_name
ORDER BY average_sun DESC
IMIT 3
In this sample query, we're averaging the amount of sunlight per US state and ordering the top three states by the highest sunlight potential. As you can see, the top three states are New Mexico, Arizona, and Nevada.
