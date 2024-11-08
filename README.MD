
# New York City Airbnb Analysis

This project analyzes Airbnb listings in New York City using data from Kaggle. The goal is to uncover insights about prices, availability, and host activities across neighborhoods. By examining patterns in Airbnb listings, we can gain an understanding of market trends and neighborhood popularity in NYC.

## Table of Contents
1. [Project Overview](#project-overview)
2. [Dataset](#dataset)
3. [Project Structure](#project-structure)
4. [Analysis and Insights](#analysis-and-insights)
5. [Technologies Used](#technologies-used)
6. [Conclusion](#conclusion)

## Project Overview

In this project, I perform data analysis on New York City Airbnb data to explore:
- Average prices by neighborhood and room type
- Host activity and number of listings per host
- Availability patterns across the year
This analysis can help understand the dynamics of short-term rentals in NYC and provide insights for hosts, guests, and policymakers.

## Dataset

The dataset used is the [New York City Airbnb Open Data](https://www.kaggle.com/datasets/dgomonov/new-york-city-airbnb-open-data) from Kaggle, which includes information on:
- `id`: Listing ID
- `name`: Listing title
- `host_id`: Host's unique ID
- `neighbourhood_group`: The borough of NYC where the listing is located
- `price`: Price per night in USD
- `minimum_nights`: Minimum stay required
- and more...

### File Location
- The dataset file (`AB_NYC_2019.csv`) is located in the `data` folder of this repository.

## Project Structure

- `data/`: Contains the Airbnb dataset in CSV format.
- `analysis.sql`: SQL queries used for data exploration and analysis.
- `README.md`: Project documentation.

## Analysis and Insights

Key insights from the analysis include:
- **Average Price by Neighborhood**: Manhattan has the highest average listing price, while the Bronx has the lowest.
- **Availability Trends**: Listings in Brooklyn and Manhattan have higher availability throughout the year.
- **Top Hosts**: A small number of hosts manage a significant portion of listings, indicating some hosts operate at scale.

Details of each analysis step can be found in the `analysis.sql` file (or `analysis_notebook.ipynb` if using Python).

## Technologies Used

- **SQL** for data analysis and querying
- **Python** and **Pandas** (if using Jupyter Notebook)
- **Git** for version control
- **GitHub** for project hosting
