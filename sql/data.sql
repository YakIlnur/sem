INSERT INTO users values('Ilnur', 'blablabla','TRUE');
INSERT INTO users values('Nastya', 'alala','TRUE');

INSERT INTO authorities values('Ilnur', 'ROLE_ADMIN');

INSERT INTO posts values(1, 'First post', 'This is first post', 'Ilnur', '2014-10-31');
INSERT INTO posts values(2, 'Second post', 'This is second post', 'Nastya', '2014-10-31');

INSERT INTO images values(1, 'http://www.homeshop.kz/img/items/99/l/55508130.jpg');
INSERT INTO images values(2, 'http://www.24-7-365.ru/pictures/3053621b.jpg');

INSERT INTO posts_images values(default,1, 1);
INSERT INTO posts_images values(default,2, 2);
INSERT INTO posts_images values(default,1, 2);
INSERT INTO posts_images values(default,2, 1);

INSERT INTO tags values(default,'first');
INSERT INTO tags values(default,'java');
INSERT INTO tags values(default,'jsp');
INSERT INTO tags values(default,'html');
INSERT INTO tags values(default,'second');
INSERT INTO tags values(default,'bla');

INSERT INTO posts_tags values(default,1,1);
INSERT INTO posts_tags values(default,1,2);
INSERT INTO posts_tags values(default,2,5);
INSERT INTO posts_tags values(default,2,4);

INSERT INTO comments values(default,1,1,'this is cool');
INSERT INTO comments values(default,2,2,'this is cool');
INSERT INTO comments values(default,1,2,'yes, a agree');
INSERT INTO comments values(default,2,1,'yes, a agree');