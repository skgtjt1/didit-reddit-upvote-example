-- Next Auth standard tables, see https://authjs.dev/reference/adapter/pg#setup

CREATE TABLE users
(
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  email VARCHAR(255),
  "emailVerified" TIMESTAMPTZ,
  image TEXT
);

-- Accounts table
CREATE TABLE accounts
(
  id SERIAL PRIMARY KEY,
  "userId" INTEGER NOT NULL,
  type VARCHAR(255) NOT NULL,
  provider VARCHAR(255) NOT NULL,
  "providerAccountId" VARCHAR(255) NOT NULL,
  refresh_token TEXT,
  access_token TEXT,
  expires_at BIGINT,
  id_token TEXT,
  scope TEXT,
  session_state TEXT,
  token_type TEXT,

  FOREIGN KEY ("userId") REFERENCES users(id) ON DELETE CASCADE
);

-- Sessions table
CREATE TABLE sessions
(
  id SERIAL PRIMARY KEY,
  "userId" INTEGER NOT NULL,
  expires TIMESTAMPTZ NOT NULL,
  "sessionToken" VARCHAR(255) NOT NULL,

  FOREIGN KEY ("userId") REFERENCES users(id) ON DELETE CASCADE
);

-- Verification Token table
CREATE TABLE verification_token
(
  identifier TEXT NOT NULL,
  expires TIMESTAMPTZ NOT NULL,
  token TEXT NOT NULL,

  PRIMARY KEY (identifier, token)
);

-- Posts table
CREATE TABLE posts
(
  id SERIAL PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  body TEXT,
  user_id INT REFERENCES users(id) ON DELETE CASCADE,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Comments table
CREATE TABLE comments
(
  id SERIAL PRIMARY KEY,
  body TEXT NOT NULL,
  user_id INT REFERENCES users(id) ON DELETE CASCADE,
  post_id INT REFERENCES posts(id) ON DELETE CASCADE,
  parent_comment_id INT REFERENCES comments(id),
  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Votes table
CREATE TABLE votes
(
  id SERIAL PRIMARY KEY,
  user_id INT REFERENCES users(id) ON DELETE CASCADE,
  post_id INT NULL REFERENCES posts(id) ON DELETE CASCADE,
  vote SMALLINT CHECK (vote IN (-1, 1)),
  vote_type VARCHAR(255) CHECK (vote_type IN ('post', 'comment')),
  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  UNIQUE(user_id, post_id, vote_type)
);
