# Dext Analytics Engineering Take-Home

## Background

Dext helps small and medium businesses capture receipts, manage expenses, and sync financial data with accounting software like Xero and QuickBooks.

The engineering team recently set up a CDC (Change Data Capture) pipeline from the operational PostgreSQL database into the cloud data warehouse using Singer. The pipeline lands raw event records into four tables in the `raw` schema. Because this is a CDC feed, **the same entity can appear multiple times** in a raw table — each row represents the full state of the record at a point in time.

Two columns are added by the pipeline on every table:

| Column | Description |
|--------|-------------|
| `_sdc_extracted_at` | When Singer extracted this version of the row |
| `_sdc_deleted_at` | `NULL` if the record is active; populated with a timestamp if the record was deleted in the source system |

The source tables also carry their own `created_at` and `updated_at` timestamps.

## Raw tables

These are provided as dbt seeds. Load them with `dbt seed`.

| Seed file | Source table |
|-----------|-------------|
| `raw_expense_claims.csv` | `expenses.expense_claims` |
| `raw_expense_line_items.csv` | `expenses.expense_line_items` |
| `raw_suppliers.csv` | `expenses.suppliers` |
| `raw_employees.csv` | `expenses.employees` |

## What the business needs

Your models should be able to answer the following questions:

**Finance**
1. What is the total approved and paid spend by employee department so far this month?
2. Which expense claims are currently awaiting payment (approved but not yet paid)?
3. What is the spend breakdown by supplier category?

**Compliance and audit**
4. Were any expense claims modified after they were first approved? If so, what changed?
5. What is the full status history for a given expense claim?

## Your task

Model this data using dbt. You decide how to structure your project — there is no single correct answer. We are more interested in your reasoning than in whether you arrived at a specific structure.

Don't try to build something too big or ambitious. We just want to see how you think.

At a minimum, your solution should:

- Correctly resolve the CDC history so the downstream questions above can be answered reliably
- Be committed to git with a clear, readable history
- Include a `NOTES.md` (use the provided `NOTES.md.example` as a template)

Tests are welcome but not required.

## Deliverables

Fork this repository, do your work on your fork, and share the link with us when you're done.

## Setup

1. `dbt deps`
2. `dbt seed`
3. `dbt run`

## What we will discuss in the debrief

- How did you resolve the CDC data? What edge cases did you think about?
- Why did you structure your models the way you did?
- What are the different requirements of the finance and compliance use cases, and how did that shape your approach?
- What assumptions did you make about the data?
- What would you do differently with more time?
