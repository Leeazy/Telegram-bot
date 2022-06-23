drop table if exists budget;
create table budget(
    codename varchar(255) primary key,
    daily_limit integer
);

drop table if exists category;
create table category(
    codename varchar(255) primary key,
    name varchar(255),
    is_base_expense boolean,
    aliases text
);

drop table if exists expense;
create table expense(
    id integer primary key,
    amount integer,
    created datetime,
    category_codename integer,
    raw_text text,
    FOREIGN KEY(category_codename) REFERENCES category(codename)
);

insert into category (codename, name, is_base_expense, aliases)
values
    ("products", "products", true, "food"),
    ("coffee", "coffee", true, ""),
    ("dinner", "dinner", true, "canteen, lunch, business-lunch"),
    ("cafe", "cafe", true, "restaurant, mcdonalds, kfc, ilpatio, il patio"),
    ("transport", "transport", false, "metro, bus, train"),
    ("taxi", "taxi", false, "yandex taxi"),
    ("phone", "phone", false, "tele2, beeline"),
    ("books", "books", false, ""),
    ("internet", "internet", false, "inet"),
    ("subscriptions", "subscriptions", false, "subscription, sub"),
    ("other", "other", true, "");

insert into budget(codename, daily_limit) values ('base', 1000);
