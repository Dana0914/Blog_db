

create table users (
    id serial8 not null,
    login varchar (20) not null,
    password varchar (20) not null,
    name varchar (40) not null,
    surname varchar (40) not null,
    primary key (id),
    unique(login, password)
);

create table categories (
    id serial8 not null,
    name varchar (40) not null,
    primary key (id),
    unique(name)
);

create table articles (
    id serial8 not null,
    user_id int8 not null,
    category_id int8 not null,
    content text not null,
    status varchar (20) not null,
    publish_date date,
    CHECK (status in ('published', 'not published')),
    primary key (id),
    foreign key (user_id) references users(id),
    foreign key (category_id) references categories(id)
);


create table comments (
    id serial8 not null,
    user_id int8 not null,
    article_id int8 not null,
    primary key (id),
    foreign key (user_id) references users(id),
    foreign key (article_id) references articles(id),
    comments text not null
);

insert into users (login, password, name, surname)
values ( 'liza@89', 'f8N4lq0', 'liza', 'turner'),
       ('tim@088', 'yP89$7a', 'tim', 'maison'),
       ( 'rayan@401', 'v8K3mN', 'ray', 'hirsh'),
       ('elaine@05', 'b8lOv2', 'ellie', 'west');

insert into categories (name)
values ( 'anime'),
       ('manga');

insert into articles (user_id, category_id, content, status, publish_date)
values ( 1,2, 'Short list of reincarnated as hero in another world',
        'published', '2023-11-13'),
        ( 4,1, 'Solo Leveling the most awaited anime of 2024',
         'published', '2023-06-06');

insert into comments (user_id,article_id, comments)
values (3,1,'Honestly, I am fed up with this type of genre. As they come out every season. ' ||
          'I would prefer reading something worthy than this trash'),
       (1, 2,'I already have read this manga and it is truly masterpiece. ' ||
           'I cant wait to see it on screen!');

select concat(u.name, u.surname) as fullname,
       a.status,
       a.content,
       c.name,
       c2.comments
from users u
join articles a on u.id = a.user_id
join categories c on c.id = a.category_id
join comments c2 on a.id = c2.article_id


