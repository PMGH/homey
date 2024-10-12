**Table of Contents**

- [Task](#task)
- [Brief](#brief)
- [Prerequisites](#prerequisites)
- [Getting Started](#getting-started)
- [Logging in](#logging-in)
- [Useful Links](#useful-links)

## Task

Use Ruby on Rails to build a project conversation history. A user should be able to:

- leave a comment
- change the status of the project

The project conversation history should list comments and changes in status.

Please don’t spend any more than 3 hours on this task.

## Brief

Treat this as if this was the only information given to you by a team member, and take the approach you would normally take in order to build the right product for the company.

To this extent:

- Please write down the questions you would have asked your colleagues
- Include answers that you might expect from them
- Then build a project conversation based on the answers to the questions you raised.

## Prerequisites

Ruby version: 3.3.1

Rails version: 7.1.4

## Getting Started

Install dependencies

```bash
bundle install
```

Setup database:

```bash
rails db:create db:migrate db:seed
```

Run the tests:

```bash
rails test
```

## Logging in

The application uses [Devise](https://github.com/heartcombo/devise) for authentication.

A seed user has been added to the `db/seeds.rb` file with login credentials as follows:

**Email:** `seed@example.com`  
**Password:** `Seed123`

## Useful Links

| Link       | URL |
| ---------- | --- |
| Production | TBC |
