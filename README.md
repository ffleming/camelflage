# Camelflage

I created this application to test timing-attack exploit tools.  It's easier to
develop an exploitation toolchain when you have an application that is both
vulnerable and configurable in its vulnerability.

Route | Required parameters | Optional Parameters
--- | --- | ---
`/timing/conditional_hashing` | `login` | `delta`
`/timing/string_comparison` | `password` | `delta`
`/timing/login` | `login`, `password` | `delta`
`/timing/basic_auth` | `password` | `delta`
`/injections/sql/raw_sql` | `name` |
`/injections/sql/raw_where` | `name` |
`/injections/template/interpolation` | `name` |

## Usage
```bash
% cp .env.sample .env
```
Edit `.env` to contain appropriate values, then
```
% bundle exec rails s
```

## Timing Vulnerabilities
### Conditional Hashing

The `login` parameter is the email address to test for inclusion in the
"database," and is required.

The `delta` URL parameter can be provided to tell the application the timing
differential between an account that exists in the database (and so a password
would be hashed for comparison) and one that is not, in seconds.  Bcrypt
generally targets 100ms of compute time.  While you can set `delta` as high as
`0.2`, values under `0.1` are probably what you're after.

### Insecure string comparison

The `password` parameter is required.

The `delta` URL parameter can be provided to tell the application the length of
time to spend "processing" a single character in seconds.  You can set it as
high as `0.05`.  The longer the comparison takes, the longery you wait before
the early return.  Use `0` to test the actual timing difference of an insecure
comparison (that is, no additional delay is introduced).

### Login

`login` and `password` parameters are required.

This endpoint simply combines conditional hashing and insecure string comparison
for a full vulnerable login experience.  A provided `delta` parameter will be
used for both operations (maximums for each are set separately).

### Basic Auth

`password` is required.

This endpoint applies insecure string comparison to the `password` field of HTTP basic
authentication.  Use whatever you like for the username (or nothing at all).

## Injection Vulnerabilities

### Raw SQL Query Injection

This endpoint executes a raw SQL string that is vulnerable to injection.
`name` is the injected parameter, and it is required.

### Raw where SQL Injection

This endpoint executes a `.where` with an argument of an interpolated string.
`name` is the injected parameter, and it is required.

## Template Injection Vulnerability

This endpoint interpolates the contents of the `name` parameter into an ERB
template.
