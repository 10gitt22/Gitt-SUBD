ALTER TABLE Товари
ADD [Посилання] [nvarchar](255) NOT NULL;

ALTER TABLE Товари
DROP COLUMN Посилання

ALTER TABLE Товари
ALTER COLUMN [Ціна товару] int NOT NULL;

ALTER TABLE Товари
ADD CHECK ([Ціна товару]<=100000 AND [Ціна товару]>0)