drop table if exists comments;
drop table if exists ratings;
drop table if exists articles;
drop table if exists categories;

create table categories (
   id int primary key auto_increment,
   name varchar(100) not null unique
);

create table articles (
   id int primary key auto_increment,
   category_id int not null,
   title varchar(255) not null,
   content text not null,
   publication_date timestamp default current_timestamp,
   update_date timestamp default current_timestamp on update current_timestamp,
   constraint fk_category foreign key (category_id) references categories(id) on delete cascade
);

create table comments (
   id int primary key auto_increment,
   article_id int not null,
   user_name varchar(100) not null,
   comment text not null,
   comment_date timestamp default current_timestamp,
   constraint fk_article_comment foreign key (article_id) references articles(id) on delete cascade
);

create table ratings (
   id int primary key auto_increment,
   article_id int not null,
   ip_address varchar(45) not null,
   rating tinyint not null check (rating between 1 and 5),
   rating_date timestamp default current_timestamp,
   unique key uq_article_ip (article_id, ip_address),
   constraint fk_article_rating foreign key (article_id) references articles(id) on delete cascade
);



insert into categories (name)
values 
    ('Art'),
    ('Sports'),
    ('Cooking'),
    ('Skicare');


insert into articles (category_id, title, content, publication_date)
values
    ((select id from categories where name = 'Art'), 
     'The Evolution of Modern Sculpture', 
     'Exploring the transformative journey of sculpture from classical to contemporary styles.', 
     '2023-12-01 10:00:00'),
    ((select id from categories where name = 'Sports'), 
     'The Fundamentals of Powerlifting', 
     'An in-depth guide to mastering the squat, bench press, and deadlift for strength enthusiasts.', 
     '2023-12-02 12:00:00'),
    ((select id from categories where name = 'Cooking'), 
     'Delicious High-Protein Meals', 
     'Quick and easy recipes packed with protein to fuel your day and workouts.', 
     '2023-12-03 14:30:00'),
    ((select id from categories where name = 'Skincare'), 
     'The Science of Sunscreen', 
     'Understanding how sunscreen protects your skin and choosing the right SPF for you.', 
     '2023-12-04 09:15:00');


insert into comments (article_id, user_name, comment)
values
    ((select id from articles where title = 'The Evolution of Modern Sculpture'), 
     'MichelangeloFan', 'I love how this article highlights how classical slowly turned into our modern styles.'),
    ((select id from articles where title = 'The Evolution of Modern Sculpture'), 
     'Donatello', 'Very insightful! Sculpture truly is a timeless art form, even tho it changes as the time flies by...');

insert into comments (article_id, user_name, comment)
values
    ((select id from articles where title = 'The Fundamentals of Powerlifting'), 
     'GymRat99', 'Nice article, I’ve been struggling with my squat form, and this really helped.'),
    ((select id from articles where title = 'The Fundamentals of Powerlifting'), 
     'AlisaGhvozd', 'Powerlifting changed my life, and this article captures the essence perfectly.');

insert into comments (article_id, user_name, comment)
values
    ((select id from articles where title = 'Delicious High-Protein Meals'), 
     'FoodieGal', 'Tried the chicken recipe, and it was amazing! Thanks for sharing.'),
    ((select id from articles where title = 'Delicious High-Protein Meals'), 
     'ChefMike', 'The lentil dish is my new favorite! Great list of recipes.');

insert into comments (article_id, user_name, comment)
values
    ((select id from articles where title = 'The Science of Sunscreen'), 
     'SunshineLover', 'Very informative! I didn’t realize the importance of reapplying sunscreen.'),
    ((select id from articles where title = 'The Science of Sunscreen'), 
     'DermExpert', 'Excellent breakdown of SPF types and usage! Great read.');


insert into ratings (article_id, ip_address, rating)
values
    ((select id from articles where title = 'The Evolution of Modern Sculpture'), '192.168.1.101', 5),
    ((select id from articles where title = 'The Evolution of Modern Sculpture'), '192.168.1.102', 4);

insert into ratings (article_id, ip_address, rating)
values
    ((select id from articles where title = 'The Fundamentals of Powerlifting'), '192.168.1.103', 5),
    ((select id from articles where title = 'The Fundamentals of Powerlifting'), '192.168.1.104', 4);

insert into ratings (article_id, ip_address, rating)
values
    ((select id from articles where title = 'Delicious High-Protein Meals'), '192.168.1.105', 5),
    ((select id from articles where title = 'Delicious High-Protein Meals'), '192.168.1.106', 5);

insert into ratings (article_id, ip_address, rating)
values
    ((select id from articles where title = 'The Science of Sunscreen'), '192.168.1.107', 4),
    ((select id from articles where title = 'The Science of Sunscreen'), '192.168.1.108', 5);
