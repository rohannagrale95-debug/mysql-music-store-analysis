# Music Store Sales Analysis with MySQL

A beginner SQL learning project for Rohan Nagrale using the open-source
[Chinook sample database](https://github.com/lerocha/chinook-database).
Eight queries explore customers, sales, countries, and music genres.

**Tools:** MySQL · SQL · MySQL Workbench or another SQL client  
**Skills:** SELECT, JOIN, LEFT JOIN, GROUP BY, ORDER BY, aggregate functions,
date formatting, and subqueries.

## Verified findings

The complete setup and all eight queries were run on MySQL 8.4.13.1 on
25 November 2026. See [RESULTS.md](RESULTS.md) for actual output excerpts,
complete result row counts, and data checks.

- 59 customers placed 412 invoices, totaling **2,328.60** in sample sales.
- Average invoice value is **5.65**.
- The USA has the highest country revenue: **523.06**.
- Rock is the leading genre: **826.65** from 835 units sold.
- Every customer in this sample has at least one invoice.

These findings describe generated sample sales, not a real business. Sales
revenue is not profit; cost data is not available in this sample.

## Run the project

Requires MySQL Server and a SQL client. The project was verified with MySQL 8.4.

### In MySQL Workbench

1. Connect to a local practice MySQL server.
2. Open `01_setup.sql` and execute the complete script once. It creates and
   populates a new database named `rohan_music_store` with eleven tables.
3. Open `02_analysis.sql`. Execute the initial `USE` statement, then run each
   analysis query to inspect its result.
4. Compare the results with `RESULTS.md`.

The setup script deliberately contains no DROP DATABASE. Use a fresh database
name. If `rohan_music_store` already exists, do not rerun the setup; run the
analysis file instead. Stop on SQL errors rather than forcing execution.

### From a terminal

Run these commands from the project folder, replacing `YOUR_MYSQL_USER` with
your local database user. MySQL prompts for the password; it is not stored here.

```sh
mysql --default-character-set=utf8mb4 -u YOUR_MYSQL_USER -p < 01_setup.sql
mysql --default-character-set=utf8mb4 -u YOUR_MYSQL_USER -p --table < 02_analysis.sql
```

The pre-generated SQL script includes the schema and sample data. Python,
Docker, .NET, and a dashboard tool are not required to run these SQL files.

## Business questions

| Query | Question | Main concept |
| --- | --- | --- |
| 1 | How many customers does the store have? | COUNT |
| 2 | What are total sales and average invoice value? | SUM, AVG |
| 3 | Which countries generate the most revenue? | GROUP BY, sorting |
| 4 | Who are the five highest-spending customers? | JOIN, LIMIT |
| 5 | Which genres generate the most revenue? | Multiple joins |
| 6 | Which customers have no invoices? | LEFT JOIN, IS NULL |
| 7 | How does monthly revenue change? | Date formatting |
| 8 | Which invoices exceed the average value? | Subquery |

## Interview guide

The main relationship is:

`Customer → Invoice → InvoiceLine → Track → Genre`

Each customer can place many invoices; each invoice can contain many lines.
Each line records the price and quantity of a track purchased.

Be ready to explain:

- How a primary key identifies a row and a foreign key links tables.
- Why customer spending uses invoice totals, while genre revenue uses line
  prices multiplied by quantity. Joining invoice headers to lines and summing
  invoice totals would count some invoices more than once.
- How LEFT JOIN preserves customers even when they have no invoice.
- Why query 6 returns zero rows on this particular sample.
- How a subquery calculates the average used by query 8.
- Why historical sales use `InvoiceLine.UnitPrice`, not the catalog price.

Suggested introduction: “This is a learning project based on the open-source
Chinook database. It explores music-store sales using joins, aggregation, and
subqueries.”

For further practice, add a query ranking artists by sales and explain why
invoice totals cannot be summed after joining to individual tracks.

## Source, adaptation, and license

The database schema and sample data are by **Luis Rocha**, reused from
[Chinook v1.4.5](https://github.com/lerocha/chinook-database/releases/tag/v1.4.5).
The original copyright and permission notice is retained in [LICENSE.md](LICENSE.md).

- Original file: `Chinook_MySql.sql`, retrieved on 25 November 2026.
- Setup adaptation: removed DROP DATABASE and renamed `Chinook` to
  `rohan_music_store`. Schema and sample rows are otherwise unchanged.
- Analysis queries, documentation, and local validation were prepared with AI
  assistance as a learning starter. The sample database is not an original
  schema designed by Rohan.
- Customer and employee identities in the dataset are fictitious sample data.
