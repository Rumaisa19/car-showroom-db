# Car Showroom — PostgreSQL Schema

A relational database schema for a car dealership management system
built with PostgreSQL. Models inventory, sales, customers, staff,
and service operations with real Pakistani market data.

---

## Tech Stack

| | |
|---|---|
| Database | PostgreSQL |
| Schema Design | Normalized relational model with foreign keys |

---

## Schema

**5 Tables — fully relational**

| Table | Description |
|---|---|
| `Customers` | Customer profiles with city, state, join date |
| `Cars` | Inventory — brand, model, year, price, color, stock |
| `Salespersons` | Sales staff with department and hire date |
| `Sales` | Transaction records — links customer, car, salesperson |
| `ServiceRecords` | Post-sale service history per vehicle |

**Key Relationships**
- Sales references Customers, Cars, and Salespersons
- ServiceRecords references Cars
- Brands include Honda, Toyota, Suzuki, Tesla

---

## Sample Data

- 6 customers across Lahore, Karachi, Islamabad, Multan, Quetta, Peshawar
- 11 cars across 4 brands — price range $15,000 to $90,000
- 3 salespersons, 15 sales transactions, 10 service records

---

## Queries Implemented

**Aggregate Functions**
- Total customer count
- Average and max sale price
- Total inventory count
- Earliest and latest sale dates

**GROUP BY**
- Model count per brand
- Total sales revenue per salesperson
- Average price per car
- Average service cost per service type
- Car count by brand and color

**HAVING**
- Brands with more than 5 models
- Cars sold more than 10 times
- Salespersons averaging over $50,000 per sale
- Months with more than 20 sales
- Service types averaging over $500

---

## Setup
```bash
psql -U postgres -f car_showroom_schema.sql
```

---

## Developer

**Rumaisa Mushtaq** — Flutter Developer
- GitHub: [Rumaisa19](https://github.com/Rumaisa19)
- LinkedIn: [rumaisamushtaq](https://linkedin.com/in/rumaisamushtaq)
```
