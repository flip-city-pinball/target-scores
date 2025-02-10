# Target Scores

Tool for generating custom sets of ratings from [pinscores.net](https://pinscores.net).

### Usage

```bash
USAGE: target-scores <id> <ratings> [--only-scores] [--rounded]

ARGUMENTS:
  <id>                    Pinball Map location id.
  <ratings>               Comma delimited array of ratings.

OPTIONS:
  --only-scores           Only show scores.
  --rounded               Scores are rounded down after 2 orders of magnitude
  -h, --help              Show help information.
```

### Sample Output
```
AC/DC (Premium)
  10 — 96,000,000 (9.5)
  9 — 62,000,000 (9.0)
  8 — 37,000,000 (8.0)
  7 — 26,000,000 (7.0)
  6 — 20,000,000 (6.0)
  5 — 15,000,000 (5.0)
  4 — 12,000,000 (4.0)
  3 — 9,500,000 (3.0)
  2 — 7,300,000 (2.0)
  1 — 5,200,000 (1.0)
Avengers: Infinity Quest (Premium)
  10 — 190,000,000 (9.5)
  9 — 130,000,000 (9.0)
  8 — 77,000,000 (8.0)
  7 — 52,000,000 (7.0)
  6 — 36,000,000 (6.0)
  5 — 25,000,000 (5.0)
  4 — 18,000,000 (4.0)
  3 — 12,000,000 (3.0)
  2 — 8,300,000 (2.0)
  1 — 5,000,000 (1.0)
Batman 66 (Premium)
  10 — 760,000,000 (9.5)
  9 — 400,000,000 (9.0)
  8 — 190,000,000 (8.0)
  7 — 120,000,000 (7.0)
  6 — 79,000,000 (6.0)
  5 — 56,000,000 (5.0)
  4 — 40,000,000 (4.0)
  3 — 29,000,000 (3.0)
  2 — 20,000,000 (2.0)
  1 — 13,000,000 (1.0)
```
