CREATE DATABASE MusicShopDb;
USE [MusicShopDb]
CREATE TABLE Виробники (
[Код] [int] NOT NULL PRIMARY KEY,
	[Назва фірми] [nvarchar](255) NOT NULL,
	[Країна виробника] [nvarchar](255) NOT NULL,
);
CREATE TABLE Категорії (
[Код категорії] [int] NOT NULL PRIMARY KEY,
	[Категорія товару] [nvarchar](255) NOT NULL,
);
CREATE TABLE Товари (
[ID товару] [int] NOT NULL PRIMARY KEY,
	[Категорія товару] [int] NOT NULL,
	[Назва товару] [nvarchar](255) NOT NULL,
	[Виробник товару] [int] NOT NULL,
	[Ціна товару] [int] NULL,
);
CREATE TABLE Замовлення (
[Номер замовлення] [int] NOT NULL PRIMARY KEY,
	[ID клієнта] [int] NOT NULL,
	[ID товару] [int] NOT NULL,
	[ID кур'єра] [int] NOT NULL,
	[Ціна] [int] NULL,
	[Дата замовлення] [datetime] NOT NULL,
);
CREATE TABLE Клієнти (
[ID клієнта] [int] NOT NULL PRIMARY KEY,
	[Прізвище] [nvarchar](255) NOT NULL,
	[Ім'я] [nvarchar](255) NOT NULL,
	[По-батькові] [nvarchar](255) NOT NULL,
	[Номер телефону] [nvarchar](255) NOT NULL,
	[Електронна пошта] [nvarchar](255) NOT NULL,
	[Адрес] [nvarchar](255) NOT NULL,
);
CREATE TABLE [Кур'єри] (
[ID кур'єра] [int] NOT NULL PRIMARY KEY,
	[Прізвище] [nvarchar](255) NOT NULL,
	[Ім'я] [nvarchar](255) NOT NULL,
	[По-батькові] [nvarchar](255) NOT NULL,
	[Номер телефону] [nvarchar](255) NOT NULL,
);

ALTER TABLE [Товари]
	ADD
	FOREIGN KEY ([ID товару]) REFERENCES Категорії ([Код категорії])
	 ON DELETE CASCADE ON UPDATE CASCADE
ALTER TABLE [Товари]
	ADD
	FOREIGN KEY ([Виробник товару]) REFERENCES Виробники ([Код])
	 ON DELETE CASCADE ON UPDATE CASCADE
ALTER TABLE [Замовлення]
	ADD
	FOREIGN KEY ([ID клієнта]) REFERENCES Клієнти ([ID клієнта])
	 ON DELETE CASCADE ON UPDATE CASCADE
ALTER TABLE [Замовлення]
	ADD
	FOREIGN KEY ([ID товару]) REFERENCES Товари ([ID товару])
	 ON DELETE CASCADE ON UPDATE CASCADE
ALTER TABLE [Замовлення]
	ADD
	FOREIGN KEY ([ID кур'єра]) REFERENCES [Кур'єри] ([ID кур'єра])
	 ON DELETE CASCADE ON UPDATE CASCADE