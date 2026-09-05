# Do Bigger Movie Budgets Actually Pay Off?

I looked at data on almost 4,800 movies to answer a question that sounds obvious but isn't:
**does spending more money on a movie make it more profitable?** I also looked at whether
certain genres or release months tend to perform better financially than others.

## Why I Looked Into This

If I worked as an analyst at a film studio, this is the kind of question I'd get asked before
the studio decides where to spend next year's budget:

1. Which genres actually make the most money back, relative to what they cost?
2. Is a bigger budget a safer bet, or does it just mean bigger numbers overall?
3. Does it matter what time of year a movie comes out?

## The Data

I used the [TMDB 5000 Movie Dataset](https://www.kaggle.com/datasets/tmdb/tmdb-movie-metadata)
from Kaggle, which has budget, revenue, genre, and release date info for about 4,800 movies
released between 1916 and 2017.

**Cleaning up the data:** About a third of the movies (1,574 out of 4,803) were missing a
budget or revenue number entirely (listed as $0), so I left those out — they're missing data,
not real flops. I also found a few movies with budgets like $1 or $10, which are obviously
typos, not real numbers. I set a minimum budget of $10,000 to filter those out, while still
keeping real ultra-low-budget movies like *Paranormal Activity* (made for just $15,000), since
those are legitimate and actually interesting to look at, not mistakes.

## Tools I Used

SQL (using a free tool called DB Browser for SQLite) to pull and analyze the data, and Excel
to make the charts.

## What I Found

### 1. Horror movies make back way more than their budget, on average

| Genre | # of Movies | Avg. Return (x budget) |
|---|---|---|
| Horror | 196 | 104x |
| Documentary | 29 | 22x |
| Western | 22 | 8.3x |
| Animation | 99 | 7.2x |
| Drama | 740 | 6.1x |
| Adventure | 287 | 5.7x |
| Comedy | 633 | 5.3x |
| Action | 588 | 2.9x |

*(chart: `charts/genre_roi.png`)*

On average, horror movies make back over 100 times what they cost — far ahead of every other
genre. But that doesn't mean horror is a safe bet. A couple of massive hits are pulling this
number up, especially *Paranormal Activity* (cost $15,000, made $193 million — a 12,890x return)
and *The Blair Witch Project*. Most horror movies don't come close to that. The number reflects
a few breakout successes more than a reliable pattern across the genre.

### 2. Spending more money doesn't mean making more money back

| Budget Size | # of Movies | Avg. Return (x budget) |
|---|---|---|
| Small (under $5M) | 416 | 63x |
| Medium ($5M–$50M) | 1,842 | 3.8x |
| Big (over $50M) | 956 | 2.7x |

*(chart: `charts/budget_tier_roi.png`)*

This one surprised me. The usual assumption is that spending more makes a movie a safer bet —
but cheaper movies actually made back far more relative to what they cost. A few breakout
low-budget hits are part of the story, but the pattern held up consistently: a bigger budget
buys a bigger production, not necessarily a better return.

### 3. September and July are surprisingly strong months for movie releases

| Release Month | # of Movies | Avg. Return (x budget) |
|---|---|---|
| September | 382 | 38x |
| July | 263 | 23x |
| March | 238 | 9.3x |
| October | 291 | 7.9x |
| August | 280 | 6.8x |
| January | 192 | 6.4x |

*(chart: `charts/release_month_roi.png`)*

I expected summer to dominate, and July does perform well — but September actually came out on
top. My guess is there's less competition for audience attention right after summer ends, giving
films more room to stand out. That's a theory, not a conclusion — it would be worth looking at
which specific movies are driving September's number before treating this as a reliable pattern.

## What I'd Suggest, If This Were a Real Studio Decision

1. **Don't assume "horror = guaranteed money."** The genre's average is real, but it's mostly a
   couple of outlier hits carrying the whole category. A studio betting on horror because of
   this number alone would be misreading it.
2. **Question the idea that a bigger budget is the "safer" choice.** Based on this data, it's
   actually the opposite — smaller, tighter budgets have historically paid off better,
   relatively speaking. It might make sense to fund more smaller projects instead of pouring
   everything into one big one.
3. **Take a closer look at September as a release window.** It's outperforming the usual
   "blockbuster season," and it's worth understanding why before writing it off as a fluke.
4. **A next step would be looking at the median, not just the average.** Since a few outlier
   hits are skewing a lot of these numbers, checking what a "typical" movie does (not just the
   biggest wins) would give a more realistic picture.

## What's in This Project

```
movie-roi-project/
├── data/
│   ├── tmdb_5000_movies.csv
│   └── tmdb_5000_credits.csv
├── sql/
│   └── queries.sql
├── charts/
│   ├── genre_roi.png
│   ├── budget_tier_roi.png
│   └── release_month_roi.png
└── README.md
```

## Resume Version

> Analyzed ~4,800 movies using SQL to look at return on investment by genre, budget size, and
> release timing; found that lower-budget films significantly outperform high-budget films on
> average return, and turned the findings into 4 practical recommendations.

