# Target Scores

Tool for generating custom sets target scores using ratings from [pinscores.net](https://pinscores.net) and location data from [pinballmap.com](https://github.com/pinballmap/pbm).

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
  11 — 96,000,000 (9.5)
  10 — 62,000,000 (9.0)
  9 — 37,000,000 (8.0)
  8 — 26,000,000 (7.0)
  7 — 20,000,000 (6.0)
  6 — 19,000,000 (5.9)
  5 — 14,000,000 (4.5)
  4 — 11,000,000 (3.7)
  3 — 8,400,000 (2.5)
  2 — 5,600,000 (1.2)
```
