CREATE TABLE users (
    id UUID PRIMARY KEY NOT NULL DEFAULT gen_random_uuid(),
    username VARCHAR(256) UNIQUE NOT NULL,
    password_phc VARCHAR(128) NOT NULL
);

CREATE TABLE forums (
    id UUID PRIMARY KEY NOT NULL DEFAULT gen_random_uuid(),
    name VARCHAR(256) NOT NULL
);

CREATE TABLE threads (
    id UUID PRIMARY KEY NOT NULL DEFAULT gen_random_uuid(),
    forum UUID REFERENCES forums(id) NOT NULL,
    title VARCHAR(256) NOT NULL
);

CREATE TABLE posts (
    id UUID PRIMARY KEY NOT NULL DEFAULT gen_random_uuid(),
    thread UUID REFERENCES threads(id) NOT NULL,
    author UUID REFERENCES users(id) NOT NULL,
    content VARCHAR(8192) NOT NULL
);

CREATE TABLE sessions (
    id UUID PRIMARY KEY NOT NULL DEFAULT gen_random_uuid(),
    "user" UUID REFERENCES users(id) NOT NULL,
    token CHAR(32) NOT NULL
);
