
SQL Practice: Learning Out Loud

This repo is where I've been rebuilding my SQL fundamentals from the ground up — not by watching tutorials, but by solving problems, breaking things, and writing down why the fix worked. If you're newer to SQL, I'm hoping the explanations below save you some of the confusion I went through. If you're experienced, feel free to skip to the queries — they're all commented in the folders above.

Why I built this

I already work with data professionally, but I wanted a space to practice SQL deliberately — the kind of practice where you can't just copy-paste a solution and move on. Every query in this repo, I wrote myself, got wrong at least once, and only kept once I could explain why it worked, not just that it did.

That last part turned out to be the real project. Below are a few of the concepts that tripped me up the most — written the way I wish someone had explained them to me the first time.

The concept that unlocked everything: "squish or don't squish?"

Almost every hard SQL question comes down to one decision: does my final answer have fewer rows than I started with, or does every row need to stay visible?

If you're squishing many rows into fewer (like "total sales per category") — that's GROUP BY.
If you need every row to stay separate, but each row needs some extra context from other rows (like "this employee's rank within their department") — that's a window function (OVER, PARTITION BY).
If you need both — group first, then do something row-by-row on the grouped result — that's where a subquery comes in.

Once that distinction clicked, most new problems stopped feeling like memorizing syntax and started feeling like pattern recognition.

The trickiest idea to actually get: correlated subqueries

A subquery is just a query nested inside another query. The confusing part is that some subqueries run once for the whole query, and some rerun for every single row. The difference matters a lot, and the wording of the question is your only clue.

Compare these two:

"Find employees who earn more than the company average." → one fixed number, calculated once. A regular subquery.
"Find employees who earn more than the average of their own department." → the phrase "their own" is the giveaway. The average has to be recalculated separately, per employee, based on which department that specific employee belongs to. That's a correlated subquery.

The trigger word to watch for is almost always something like "their own," "that specific," "its own" — not the comparison word itself ("more than" shows up in both examples above).

A mistake I made more than once: forgetting what GROUP BY actually allows

Any time I tried to SELECT a column that wasn't wrapped in an aggregate function (SUM, MIN, MAX, COUNT) while also using GROUP BY, SQL Server would throw an error. The reasoning finally landed when I stopped thinking about it as a syntax rule and started thinking about it literally: once rows are grouped into one bucket, there could be multiple different values for any non-aggregated column inside that bucket — so SQL has no way to know which one you actually want.

WHERE vs HAVING, the short version

WHERE filters rows before grouping happens. HAVING filters groups after aggregation. If your filter condition involves a COUNT(), SUM(), or similar, it has to be HAVING — WHERE doesn't have access to the aggregated result yet at the point it runs.

What's in this repo

Queries are organized by the concept they're testing, not by the order I solved them:

sql-practice/
├── Datasets/           → setup script for the practice tables
├── Joins/               → self-joins, LEFT JOIN patterns
├── Aggregations/        → GROUP BY, HAVING, TOP N
├── Windows-functions/   → RANK, LAG, ROW_NUMBER, running totals
├── Subqueries/          → regular and correlated subqueries
├── Case-When/           → conditional labeling logic
└── Union/                → combining result sets

Every .sql file follows the same format: the question as a comment, the query, and a short note on the reasoning behind the approach — same style as this README, just shorter.

If you're working through SQL yourself and something here doesn't make sense (or you think I've got something wrong), I'd genuinely like to hear about it — feel free to open an issue or reach out.