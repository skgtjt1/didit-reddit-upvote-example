## Upvote

Upvote is a Reddit-esque web application that allows users to create posts, upvote and downvote posts, and comment on posts in a multi-threaded, nested list.

The project is built using Next.js with the /app router and [Tailwind CSS](https://tailwindcss.com/), and uses [Auth.js (formerly Next Auth)](https://authjs.dev/) for user authentication. The data is stored in a Postgres database, which is created and accessed with raw SQL queries using the `pg` package.

The project is a work in progress and is not yet complete.

## Features

- [x] View a list of posts
- [x] View a single post
- [x] Create a post
- [x] Upvote and downvote posts
- [x] Pagination of posts
- [x] Comment on posts
- [x] Nested comments (recursive lists)
- [x] User authentication

## Setup instructions

1. Fork the repository (check "copy the main branch only") and clone your fork to your local machine
2. Run `npm install`
3. Create a `.env.local` file in the root directory and add the following environment variables:
   - `DATABASE_URL` - the URL of your Postgres database (eg. the Supabase connection string)
   - `AUTH_SECRET` - the Next Auth secret string (this can be anything at all like a password, but keep it secret!)
   - `AUTH_GITHUB_ID` - the GitHub OAuth client ID (create yours in [Github developer settings](https://github.com/settings/developers)
   - `AUTH_GITHUB_SECRET` - the GitHub OAuth client secret (create this in [Github developer settings](https://github.com/settings/developers))
4. Create the database schema by running the SQL commands in `schema.sql` in your database (eg. by running the commands in Supabase Query Editor)
5. Run `npm run dev` to start the development server
6. Open [http://localhost:3000](http://localhost:3000) with your browser to see the site

## Potential future features

- [ ] User profiles
- [ ] Sorting posts by recent (date posted), top (most upvotes), and most controversial (most upvotes _and_ downvotes)
- [ ] User karma scores
- [ ] User badges / trophies (awards for achievements like number of posts, years on the site, etc.)
- [ ] User settings (eg. number of posts per page, theme, etc.)
- [ ] Moderation tools / reporting or flagging objectionable comments for removable by admins
- [ ] Searching posts (possibly using simple SQL LIKE '%some search%', or [Postgres text search](https://www.crunchydata.com/blog/postgres-full-text-search-a-search-engine-in-a-database))
- [ ] Subreddits (separate communities, that isn't just one big list of posts, that can be created by users)
- [ ] User notifications
- [ ] User private messaging
- [ ] User blocking
- [ ] User following
- [ ] User feed (posts from users you follow)
- [ ] User flair

## my notes

- security vulnerability npm audit fix --force apparently fixes it...
- is the env working? Do I need to link to my database to get app working?
-

## error from first npm run dev:

[auth][error] MissingSecret: Please define a `secret`. .Read more at https://errors.authjs.dev#missingsecret
at assertConfig (webpack-internal:///(rsc)/./node_modules/@auth/core/lib/utils/assert.js:52:16)
at Auth (webpack-internal:///(rsc)/./node_modules/@auth/core/index.js:82:95)
at processTicksAndRejections (node:internal/process/task_queues:95:5)
at runNextTicks (node:internal/process/task_queues:64:3)
at listOnTimeout (node:internal/timers:538:9)
at process.processTimers (node:internal/timers:512:7)
⨯ Error: connect ECONNREFUSED ::1:5432
at async PostList (./src/components/PostList.jsx:19:29)
digest: "893357623"
⨯ Error: connect ECONNREFUSED ::1:5432
at async PostList (./src/components/PostList.jsx:19:29)
digest: "893357623"
⨯ src/components/UserInfo.jsx (12:25) @ name
⨯ TypeError: Cannot read properties of undefined (reading 'name')
at UserInfo (./src/components/UserInfo.jsx:19:30)
digest: "934816118"
10 | {session ? (
11 | <div>

> 12 | {session.user.name}{" "}

     |                         ^

13 | <span className="text-xs text-zinc-400 mr-3">#{session.user.id}</span>
14 | <LogoutButton />
15 | </div>
⨯ src/components/UserInfo.jsx (12:25) @ name
⨯ TypeError: Cannot read properties of undefined (reading 'name')
at UserInfo (./src/components/UserInfo.jsx:19:30)
digest: "934816118"
10 | {session ? (
11 | <div>

> 12 | {session.user.name}{" "}

     |                         ^

13 | <span className="text-xs text-zinc-400 mr-3">#{session.user.id}</span>
14 | <LogoutButton />
15 | </div>
✓ Compiled in 959ms (272 modules)
GET / 500 in 19845ms
✓ Compiled /favicon.ico in 408ms (519 modules)
GET /favicon.ico 200 in 512ms
