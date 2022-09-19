create table article_type
(
    id   int          not null
        primary key,
    type varchar(250) null
);

create table newspapers
(
    name     varchar(250) null,
    id       int          not null
        primary key,
    price    double       null,
    director varchar(250) null
);

create table articles
(
    id           int          not null
        primary key,
    title        varchar(250) null,
    description  varchar(250) null,
    id_newspaper int          not null,
    id_type      int          not null,
    author       varchar(250) null,
    constraint id_newspaper
        foreign key (id_newspaper) references newspapers (id),
    constraint id_type
        foreign key (id_type) references article_type (id)
);

create table readers
(
    id_reader int          not null
        primary key,
    name      varchar(250) null,
    birth     date         null
);

create table articles_read
(
    id         int not null
        primary key,
    reader_id  int not null,
    article_id int not null,
    rating     int null,
    constraint articles_read_articles_id_fk
        foreign key (article_id) references articles (id),
    constraint reader_id
        foreign key (reader_id) references readers (id_reader)
);

create table subscriptions
(
    id           int  not null
        primary key,
    reader_id    int  not null,
    newspaper_id int  not null,
    finish_date  date null,
    start_date   date not null,
    constraint newspaper_id
        foreign key (newspaper_id) references newspapers (id),
    constraint readers_id
        foreign key (reader_id) references readers (id_reader)
);


