# XP Team Wise

After years strugling at USP to form teams for the it's XP discipline with the following requirements:

* Respect student preferences
* Have a coach
* Respect some reasonable size
* And other XP principles like
  - pair programing (even team sizes)
  - knowledge spreading (balanced knowledge teams)
  - and others...

I've decided to write this:

* Reads input data from student preferences forms from CSV
* Approximate solutions for the problem of forming teams using genetics algorithms
* Allow manual interference from the user

It may also address other minor concerns such as team formation manipulation as they are now decided by a machine.

## How are the team fitness computed?

Given a team:

* For each member of a team git it
  - 3 points if the team's project was its 1st option
  - 1 points if the team's project was its 2nd option
  - 0 points if the team's project was its 3rd option
* Accumulate the scores
* Multiply by a bonus (defaults to 2) the team score
  - if the team has a coach
  - if the team if of a proper size (defaults to from 4 to 8)

The chromosome score is given by the teams score sum.

## What is still missing

* [ ] Acceptance tests
* [ ] Travis build
* [ ] Static code analysis
* [ ] Tweak algorithm constants in order to provide better results
  - [ ] Extract those constants into YAML configuration file
* [ ] Input personal abilities data
  - [ ] Use this data to form equilibrate teams
* [ ] Allow the user to configure

## Requirements

* Ruby (recommended 2.3.1)
* bundler

## Setup

```shell
bundle install --without development test
```

## Input format

It is expected in CSV format:

* One data entry per row
* Column order
  1. name (string)
  2. email (string)
  3. coach (true|false)
  4. project1 (string)
  5. project2 (string)
  6. project3 (string)

## Usage

Place your CSV file at the root path and prepare Docker:

```shell
docker image build . -t xpteamwise

docker container run -it xpteamwise
```

Inside the container, run: 

```shell
rake xpteamwise:generate
```

If you have hard to process input data, it shall ask you for intervention with simple "Yes/No" questions.

Finally he result should be a txt file at the root as well.

## Development

Do a full setup:

```shell
bundle install
```

Run the tests with:

```shell
rake spec
```

## License

GNU GENERAL PUBLIC LICENSE
Version 3, 29 June 2007

Copyright Rafael Reggiani Manzo 2016

See the [COPYING](COPYING) file for the full license text.
