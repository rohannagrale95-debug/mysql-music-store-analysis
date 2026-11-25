# Verified MySQL Results

Executed on MySQL 8.4.13.1 on 25 November 2026. All eight queries succeeded.
Tables below show up to ten rows each; row counts refer to the complete result.

## 1. How many customers does the store have?

Returned rows: **1**.

| customer_count |
| --- |
| 59 |

## 2. What are total sales and average invoice value?

Returned rows: **1**.

| invoice_count | total_sales | average_invoice_value |
| --- | --- | --- |
| 412 | 2328.60 | 5.65 |

## 3. Which countries generate the most revenue?

Returned rows: **24**.

| BillingCountry | revenue |
| --- | --- |
| USA | 523.06 |
| Canada | 303.96 |
| France | 195.10 |
| Brazil | 190.10 |
| Germany | 156.48 |
| United Kingdom | 112.86 |
| Czech Republic | 90.24 |
| Portugal | 77.24 |
| India | 75.26 |
| Chile | 46.62 |

## 4. Who are the five highest-spending customers?

Returned rows: **5**.

| CustomerId | FirstName | LastName | total_spend |
| --- | --- | --- | --- |
| 6 | Helena | Holý | 49.62 |
| 26 | Richard | Cunningham | 47.62 |
| 57 | Luis | Rojas | 46.62 |
| 45 | Ladislav | Kovács | 45.62 |
| 46 | Hugh | O'Reilly | 45.62 |

## 5. Which music genres generate the most revenue?

Returned rows: **24**.

| genre | units_sold | revenue |
| --- | --- | --- |
| Rock | 835 | 826.65 |
| Latin | 386 | 382.14 |
| Metal | 264 | 261.36 |
| Alternative & Punk | 244 | 241.56 |
| TV Shows | 47 | 93.53 |
| Jazz | 80 | 79.20 |
| Blues | 61 | 60.39 |
| Drama | 29 | 57.71 |
| Classical | 41 | 40.59 |
| R&B/Soul | 41 | 40.59 |

## 6. Which customers have no invoices?

Returned rows: **0**.

No matching rows. Every sample customer has at least one invoice.

## 7. What does monthly revenue look like?

Returned rows: **60**.

| sales_month | revenue |
| --- | --- |
| 2021-01 | 35.64 |
| 2021-02 | 37.62 |
| 2021-03 | 37.62 |
| 2021-04 | 37.62 |
| 2021-05 | 37.62 |
| 2021-06 | 37.62 |
| 2021-07 | 37.62 |
| 2021-08 | 37.62 |
| 2021-09 | 37.62 |
| 2021-10 | 37.62 |

## 8. Which invoices exceed the average invoice value?

Returned rows: **179**.

| InvoiceId | CustomerId | Total |
| --- | --- | --- |
| 404 | 6 | 25.86 |
| 299 | 26 | 23.86 |
| 96 | 45 | 21.86 |
| 194 | 46 | 21.86 |
| 89 | 7 | 18.86 |
| 201 | 25 | 18.86 |
| 88 | 57 | 17.91 |
| 306 | 5 | 16.86 |
| 313 | 43 | 16.86 |
| 103 | 24 | 15.86 |

## Data checks

```text
mysql_version
8.4.13
table_count
11
customer_count
59
invoice_count
412
track_count
3503
revenue_difference
0.00
orphan_invoice_lines
0
```
