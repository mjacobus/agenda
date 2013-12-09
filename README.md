# Agenda

[![Build Status](https://secure.travis-ci.org/tinyapps-br/agenda.png?branch=master)](http://travis-ci.org/tinyapps-br/agenda?branch=master)
[![Code Climate](https://codeclimate.com/github/tinyapps-br/agenda.png)](https://codeclimate.com/github/tinyapps-br/agenda)
[![Coverage Status](https://coveralls.io/repos/tinyapps-br/agenda/badge.png)](https://coveralls.io/r/tinyapps-br/agenda)
[![Dependency Status](https://gemnasium.com/tinyapps-br/agenda.png)](https://gemnasium.com/tinyapps-br/agenda)

TODO:
- Implement email sending

Presents you with a todo list. Emails them to you.

## Sending emails (to be implemented)

### Week tasks notifications

Create a cron job that runs

```ruby
rake agenda:send_weekly_tasks_email # once a week
```

### Daily tasks notifications

Create a cron job that runs

```ruby
rake agenda:send_daily_tasks_email # once a day
```

### Sending email to a specific user

```ruby
rake agenda:send_weekly_tasks_email USER=user@email.com
rake agenda:send_daily_tasks_email USER=user@email.com
```
