# Target Scores

A command line tool for generating custom sets of target pinball scores using location data from [pinballmap.com](https://github.com/pinballmap/pbm) and score ratings from [pinscores.net](https://pinscores.net).

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

### Example Output

Get a set of target scores for pinball machines at [Wedgehead](https://pinballmap.com/map/?by_location_id=10804) (location ID `10804`) using ratings `[0.5, 1, 4.5, 6, 8, 9.5]`, rounding the scores down after 2 orders of mangitude.

```bash
target-scores 10804 0.5,1,4.5,6,8.75 --rounded
```

```bash
AC/DC (Premium)
    - id: G43W4-MXrPx
    - scores:
        5    53,000,000    (8.75)
        4    20,000,000    (6.0)
        3    14,000,000    (4.5)
        2    5,200,000    (1.0)
        1    3,900,000    (0.5)
Big Game
    - id: G4jQw-MJ5rl
    - scores:
        5    570,000    (8.75)
        4    280,000    (6.0)
        3    210,000    (4.5)
        2    76,000    (1.0)
        1    57,000    (0.5)
Black Knight: Sword of Rage (Pro)
    - id: GD7Ld-ME0BP
    - scores:
        5    100,000,000    (8.75)
        4    32,000,000    (6.0)
        3    18,000,000    (4.5)
        2    3,900,000    (1.0)
        1    2,600,000    (0.5)
Bram Stoker's Dracula
    - id: G41do-MP3Py
    - scores:
        5    270,000,000    (8.75)
        4    72,000,000    (6.0)
        3    41,000,000    (4.5)
        2    8,700,000    (1.0)
        1    5,800,000    (0.5)
Deadpool (Pro)
    - id: G6lnq-Mq1kv
    - scores:
        5    190,000,000    (8.75)
        4    62,000,000    (6.0)
        3    38,000,000    (4.5)
        2    8,800,000    (1.0)
        1    5,700,000    (0.5)
Frontier
    - id: GRwjq-MJwrd
    - scores:
        5    750,000    (8.75)
        4    340,000    (6.0)
        3    250,000    (4.5)
        2    94,000    (1.0)
        1    71,000    (0.5)
Godzilla (70th Anniversary)
    - id: GweeP-Ml9pZ-AOvNL
    - scores:
        5    220,000,000    (8.75)
        4    71,000,000    (6.0)
        3    45,000,000    (4.5)
        2    13,000,000    (1.0)
        1    8,900,000    (0.5)
Indianapolis 500
    - id: Gr8l3-MDWr0
    - scores:
        5    570,000,000    (8.75)
        4    220,000,000    (6.0)
        3    140,000,000    (4.5)
        2    40,000,000    (1.0)
        1    29,000,000    (0.5)
Iron Man
    - id: GRVq4-MLyxq
    - scores:
        5    19,000,000    (8.75)
        4    8,300,000    (6.0)
        3    5,900,000    (4.5)
        2    2,400,000    (1.0)
        1    1,900,000    (0.5)
JAWS (Pro)
    - id: GLWll-MXr4N
    - scores:
        5    220,000,000    (8.75)
        4    99,000,000    (6.0)
        3    70,000,000    (4.5)
        2    27,000,000    (1.0)
        1    21,000,000    (0.5)
Junk Yard
    - id: GRLlj-MQZN8
    - scores:
        5    15,000,000    (8.75)
        4    5,600,000    (6.0)
        3    3,500,000    (4.5)
        2    1,000,000    (1.0)
        1    730,000    (0.5)
Jurassic Park (Pro)
    - id: GK17D-MdEqz
    - scores:
        5    160,000,000    (8.75)
        4    55,000,000    (6.0)
        3    35,000,000    (4.5)
        2    9,900,000    (1.0)
        1    6,800,000    (0.5)
Metallica Remastered (Premium)
    - id: GO0q3-MOEy8-ARol7
    - scores:
        5    0    (8.75)
        4    0    (6.0)
        3    0    (4.5)
        2    0    (1.0)
        1    0    (0.5)
Monster Bash (Remake)
    - id: Gr3EW-M3dBn
    - scores:
        5    56,000,000    (8.75)
        4    18,000,000    (6.0)
        3    11,000,000    (4.5)
        2    3,200,000    (1.0)
        1    2,300,000    (0.5)
NBA Fastbreak
    - id: GrO0D-MQolo
    - scores:
        5    100    (8.75)
        4    54    (6.0)
        3    40    (4.5)
        2    16    (1.0)
        1    11    (0.5)
Stars
    - id: GrXEW-MDEwr
    - scores:
        5    150,000    (8.75)
        4    80,000    (6.0)
        3    60,000    (4.5)
        2    25,000    (1.0)
        1    19,000    (0.5)
Tag-Team Pinball
    - id: G5Yyo-ML3Wo
    - scores:
        5    1,900,000    (8.75)
        4    800,000    (6.0)
        3    550,000    (4.5)
        2    190,000    (1.0)
        1    140,000    (0.5)
The Mandalorian (Pro)
    - id: GBLLP-MkPpr
    - scores:
        5    170,000,000    (8.75)
        4    61,000,000    (6.0)
        3    37,000,000    (4.5)
        2    6,400,000    (1.0)
        1    3,500,000    (0.5)
The Munsters (Premium)
    - id: GbPde-Mp43l-AOQwL
    - scores:
        5    36,000,000    (8.75)
        4    10,000,000    (6.0)
        3    5,700,000    (4.5)
        2    1,100,000    (1.0)
        1    680,000    (0.5)
The Uncanny X-Men (Premium)
    - id: G7ZEz-MyN3K-AO4qp
    - scores:
        5    72,000,000    (8.75)
        4    24,000,000    (6.0)
        3    14,000,000    (4.5)
        2    3,600,000    (1.0)
        1    2,500,000    (0.5)
Whirlwind
    - id: GrE7e-MQ9N1
    - scores:
        5    6,700,000    (8.75)
        4    3,100,000    (6.0)
        3    2,200,000    (4.5)
        2    880,000    (1.0)
        1    670,000    (0.5)
World Beauties
    - id: GRBpL-MLeYk
    - scores:
        5    1,900,000    (8.75)
        4    1,400,000    (6.0)
        3    1,200,000    (4.5)
        2    760,000    (1.0)
        1    670,000    (0.5)
```
