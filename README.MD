# New York City Airbnb Analysis

This project analyzes Airbnb listings in New York City using data from Kaggle. The goal is to uncover insights about prices, availability, and host activities across neighborhoods. By examining patterns in Airbnb listings, we gain an understanding of market trends, neighborhood popularity, and factors that influence listing success in NYC.

## Table of Contents
1. [Project Overview](#project-overview)
2. [Dataset](#dataset)
3. [Project Structure](#project-structure)
4. [Analysis and Insights](#analysis-and-insights)
5. [Technologies Used](#technologies-used)
6. [Conclusions](#conclusions)

## Project Overview

In this project, I perform data analysis on New York City Airbnb data to explore:
- Average prices by neighborhood and room type
- Host activity and number of listings per host
- Availability patterns across the year

This analysis provides insights for hosts, guests, and policymakers by highlighting the dynamics of the short-term rental market in NYC.

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
- The dataset file (`AB_NYC_2019.csv`) is located in the `Data` folder of this repository.

## Project Structure

- `Data/`: Contains the Airbnb dataset in CSV format.
- `NYC_AirBnB.sql`: SQL file with queries used for data exploration and analysis.
- `NYC_Airbnb_Analysis.ipynb`: Jupyter Notebook that provides a full analysis of the dataset, including data cleaning, exploratory data analysis (EDA), and visualizations.
- `README.md`: Project documentation with detailed analysis report.

## Analysis and Insights

This section outlines the key analyses performed and insights gained from each. For detailed SQL queries, see `NYC_AirBnB.sql`. For a complete analysis including data cleaning and visualizations, see `NYC_Airbnb_Analysis.ipynb`.

### 1. Summary Statistics for Price, Minimum Nights, and Availability
   - **Purpose**: Provides a general overview of prices, availability, and minimum stay requirements across listings.
   - **Insights**: 
     - Average and maximum prices reveal NYC’s market pricing.
     - Availability trends highlight potential booking patterns.
   - **Business Value**: Useful for benchmarking individual listings against citywide averages.

### 2. Average Price by Neighborhood
   - **Purpose**: To identify price variation by neighborhood and understand which areas command the highest prices.
   - **Insights**: 
     - Manhattan has the highest average price, indicating high demand and luxury market.
     - The Bronx has the lowest, suggesting budget-friendly options.
   - **Business Value**: Helps investors and hosts set competitive prices based on location.

### 3. Top 10 Most Expensive Listings by Neighborhood
   - **Purpose**: Highlights premium listings within each neighborhood.
   - **Insights**: Lists the highest-priced listings by neighborhood, identifying unique properties or luxury accommodations.
   - **Business Value**: Allows hosts to benchmark their pricing against premium properties.

### 4. Hosts with the Highest Average Listing Price
   - **Purpose**: To discover hosts who manage multiple high-priced listings, possibly indicating professional property management.
   - **Insights**: Identifies hosts managing premium listings, providing insights into market segmentation.
   - **Business Value**: Useful for identifying professional operators and evaluating competitive pricing.

### 5. Price Distribution by Room Type
   - **Purpose**: Examines pricing by room type to understand median and average prices in each category.
   - **Insights**: Shows how prices vary for entire homes, private rooms, etc., revealing where demand and supply align.
   - **Business Value**: Helps hosts align their pricing with market expectations for each room type.

### 6. Neighborhoods with the Highest Density of Listings
   - **Purpose**: Identifies neighborhoods with the most listings per square mile, indicating high Airbnb activity.
   - **Insights**: Dense neighborhoods like Manhattan and Brooklyn suggest popular areas for visitors.
   - **Business Value**: Assists in assessing competition and market saturation in popular neighborhoods.

### 7. Correlation Check: Price vs. Number of Reviews
   - **Purpose**: Checks if high prices correlate with high review counts, suggesting quality or demand.
   - **Insights**: Reveals whether expensive listings receive more or fewer bookings, signaling demand levels.
   - **Business Value**: Helps hosts understand demand based on pricing.

### 8. Seasonal Review Trends
   - **Purpose**: Analyzes review counts by month to infer seasonality in bookings.
   - **Insights**: Peaks in summer months suggest tourist season trends.
   - **Business Value**: Enables hosts to optimize pricing during peak seasons and plan maintenance during low seasons.

### 9. Listings with High Minimum Stay Requirements, Categorized by Room Type
   - **Purpose**: Focuses on listings with high minimum nights, typically catering to long-term guests.
   - **Insights**: Shows which room types are more often used for long stays, useful for corporate travel or longer vacations.
   - **Business Value**: Helps property owners understand the market for long-term rentals.

### 10. Availability Analysis by Price Range
   - **Purpose**: Segments listings into price ranges to analyze availability trends within each range.
   - **Insights**: High-priced listings with low availability suggest demand, while low-priced with high availability indicate high competition.
   - **Business Value**: Enables hosts to position listings competitively within price ranges to balance occupancy and revenue.

### 11. Price Outliers Detection (Using Standard Deviation)
   - **Purpose**: Identifies listings with prices significantly above the average, suggesting unique or mispriced properties.
   - **Insights**: Outliers may represent luxury listings or potential pricing errors.
   - **Business Value**: Helps hosts identify pricing inconsistencies and benchmark against high-end listings.

### 12. Manhattan Key Statistics Comparison with City Averages
   - **Purpose**: Compares Manhattan’s metrics to citywide averages to highlight unique characteristics of the Manhattan market.
   - **Insights**: Higher prices and lower availability in Manhattan reflect a premium, in-demand market.
   - **Business Value**: Provides benchmarks for Manhattan-specific pricing and availability.

## Technologies Used

- **SQL** for data analysis and querying
- **Python** and **Pandas** for data manipulation in the Jupyter Notebook
- **Matplotlib** and **Seaborn** for visualizations in the Jupyter Notebook
- **Git** for version control
- **GitHub** for project hosting

## Conclusions

The NYC Airbnb Analysis project provides several important insights:

1. **Price Trends by Location**: Manhattan consistently shows the highest average prices, making it an ideal location for premium listings. The Bronx, on the other hand, is suitable for budget accommodations.

2. **Demand Seasonality**: Review counts peak during summer months, indicating higher demand during the tourist season. Hosts can leverage this by adjusting pricing during peak times.

3. **Room Type Popularity**: Entire homes and apartments are the most popular room types, which suggests higher demand from groups or families who prefer exclusive spaces.

4. **High-Demand Areas**: Brooklyn and Manhattan have the highest density of listings, indicating popular areas with substantial competition. New hosts may want to explore less saturated neighborhoods for unique positioning.

5. **Long-Term Stay Trends**: Listings with high minimum stay requirements are more common among entire homes, likely appealing to corporate clients or long-term visitors.

6. **Market Segmentation**: A small number of hosts manage a significant number of high-priced listings, highlighting a segment of professional operators within the NYC Airbnb market.

These insights offer valuable guidance for various stakeholders, from individual hosts to investors and policymakers, in navigating NYC's competitive Airbnb market.

For the full analysis, including data cleaning, EDA, and visualizations, please see the [Jupyter Notebook](./NYC_Airbnb_Analysis.ipynb).
