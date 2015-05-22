create table "users"(
    "username" varchar(50) not null primary key,
    "password" varchar(200) not null,
    "enabled" boolean not null
);

create table "authorities" (
    "username" varchar(50) not null,
    "authority" varchar(50) not null,
    constraint fk_authorities_users foreign key("username") references "users"("username")
);
create unique index ix_auth_username on "authorities" ("username","authority");

create table "posts" (
	"id" serial NOT NULL,
	"title" varchar(50) not null,
	"content" text not null,
	"username" varchar(50) not null CONSTRAINT post_owner REFERENCES "users"("username"),
	"data" date not null,
	CONSTRAINT PK_posts PRIMARY KEY("id")
);

create table "images" (
	"id" serial NOT NULL,
	"url" varchar(50) not null,
	CONSTRAINT PK_images PRIMARY KEY("id")
);

create table "posts_images" (
	"id" serial NOT NULL,
	"post_id" integer not null CONSTRAINT posts_images REFERENCES "posts"("id"),
	"image_id" integer not null CONSTRAINT image_posts REFERENCES "images"("id"),
	CONSTRAINT PK_posts_images PRIMARY KEY("id")
);

create table "tags" (
	"id" serial NOT NULL,
	"name" varchar(50) not null,
	CONSTRAINT PK_tags PRIMARY KEY("id")
);

create table "posts_tags" (
	"id" serial NOT NULL,
	"post_id" integer not null CONSTRAINT posts_tags REFERENCES "posts"("id"),
	"tag_id" integer not null  CONSTRAINT tag_posts REFERENCES "tags"("id"),
	CONSTRAINT PK_posts_tags PRIMARY KEY("id")
);

create table "comments" (
	"id" serial NOT NULL,
	"post_id" integer not null CONSTRAINT posts_comment REFERENCES "posts"("id"),
	"user_id" integer not null CONSTRAINT comment_owner REFERENCES "posts"("id"),
	"content" text not null,
	CONSTRAINT PK_comments PRIMARY KEY("id")
);
