CREATE DATABASE fitness_club;

USE fitness_club;

CREATE TABLE Clients (
    ClientID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    DateOfBirth DATE NOT NULL,
    Phone VARCHAR(15) NOT NULL,
    Email VARCHAR(100),
    RegistrationDate DATE NOT NULL
);

CREATE TABLE Memberships (
    MembershipID INT PRIMARY KEY AUTO_INCREMENT,
    MembershipName VARCHAR(100),
    DurationDays INT,
    AccessTime TIME
);

CREATE TABLE Trainers (
    TrainerID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Phone VARCHAR(15) NOT NULL,
    Email VARCHAR(100),
    SpecializationID INT NOT NULL,
    FOREIGN KEY (SpecializationID) REFERENCES Specializations(SpecializationID)
);

CREATE TABLE Groups (
    GroupID INT PRIMARY KEY AUTO_INCREMENT,
    GroupName VARCHAR(100) NOT NULL,
    Description TEXT,
    Duration INT NOT NULL,
    TrainerID INT NOT NULL,
    FOREIGN KEY (TrainerID) REFERENCES Trainers(TrainerID)
);

CREATE TABLE Schedule (
    ScheduledID INT PRIMARY KEY AUTO_INCREMENT,
    GroupID INT,
    DateTime DATETIME,
    MaxParticipants INT,
    FOREIGN KEY (GroupID) REFERENCES Groups(GroupID)
);

CREATE TABLE Specializations (
    SpecializationID INT PRIMARY KEY AUTO_INCREMENT,
    SpecializationName VARCHAR(100)
);

CREATE TABLE Enrollments (
    EnrollmentID INT PRIMARY KEY AUTO_INCREMENT,
    ClientID INT,
    ScheduledID INT,
    ClubID INT,
    MembershipID INT,
    EnrollmentDate DATE NOT NULL,
    FOREIGN KEY (ClientID) REFERENCES Clients(ClientID),
    FOREIGN KEY (ScheduledID) REFERENCES Schedule(ScheduledID),
    FOREIGN KEY (ClubID) REFERENCES Clubs(ClubID),
    FOREIGN KEY (MembershipID) REFERENCES Memberships(MembershipID)
);

CREATE TABLE Clubs (
    ClubID INT PRIMARY KEY AUTO_INCREMENT,
    ClubName VARCHAR(100) NOT NULL,
    Address VARCHAR(255) NOT NULL
);

-- Наполнение БД

USE fitness_club;

INSERT INTO Clubs (ClubName, Address) VALUES
('Fitness City', 'ул. Центральная, 1'),
('Fitness City Pro', 'ул. Западная, 5'),
('Fitness City', 'пр. Восточный, 10'),
('Fitness City Pro', 'ул. Северная, 3'),
('Fitness City', 'ул. Южная, 7'),
('Fitness City', 'ул. Парковая, 15'),
('Fitness City', 'пр. Ленина, 20'),
('Fitness City', 'ул. Школьная, 30'),
('Fitness City Pro', 'ул. Вокзальная, 8'),
('Fitness City', 'пр. Мира, 45');

INSERT INTO Specializations (SpecializationName) VALUES
('Йога'),
('Пилатес'),
('Функциональный тренинг'),
('Кроссфит'),
('Стретчинг');

INSERT INTO Trainers (FirstName, LastName, Phone, Email, SpecializationID) VALUES
('Анна', 'Волкова', '79530000001', 'a.volkova@fitpro.ru', 1),
('Максим', 'Соколов', '79530000002', 'm.sokolov@fitpro.ru', 3),
('Иван', 'Иванов', '79530000003', 'i.ivanov@fitpro.ru', 2),
('Артем', 'Крылов', '79530000004', 'a.krylov@fitpro.ru', 4),
('Олеся', 'Мельникова', '79530000005', 'o.melnikova@fitpro.ru', 5),
('Елена', 'Петрова', '79530000006', 'e.petrova@fitpro.ru', 1),
('Дмитрий', 'Федоров', '79530000007', 'd.fedorov@fitpro.ru', 2),
('Светлана', 'Игнатова', '79530000008', 's.ignatova@fitpro.ru', 3),
('Павел', 'Белов', '79530000009', 'p.belov@fitpro.ru', 4),
('Ольга', 'Кузнецова', '79530000010', 'o.kuznetsova@fitpro.ru', 5);

INSERT INTO Groups (GroupName, Description, Duration, TrainerID) VALUES
('Рассветная йога', 'Утренние практики на рассвете', 60, 1),
('Силовые горизонты', 'Работа с собственным весом', 90, 2),
('Пилатес-детокс', 'Очищающие комплексы', 75, 3),
('Кроссфит 2.0', 'Новые методики', 120, 4),
('Гибкое тело', 'Глубокий стретчинг', 60, 5),
('Вечерняя йога', 'Расслабляющие практики вечером', 60, 6),
('Функциональный микс', 'Смешанные тренировки', 90, 7),
('Пилатес для начинающих', 'Базовые упражнения', 75, 8),
('Кроссфит интенсив', 'Высокая нагрузка', 120, 9),
('Стретчинг утро', 'Утренние упражнения на гибкость', 60, 10);

INSERT INTO Schedule (GroupID, DateTime, MaxParticipants) VALUES
(1, '2025-01-07 07:30:00', 12),
(2, '2025-01-14 19:00:00', 8),
(3, '2025-02-02 10:00:00', 10),
(4, '2025-02-18 20:00:00', 6),
(5, '2025-02-28 18:30:00', 15),
(6, '2025-03-01 08:00:00', 10),
(7, '2025-03-05 18:00:00', 12),
(8, '2025-03-10 09:30:00', 15),
(9, '2025-03-15 19:30:00', 8),
(10, '2025-03-20 07:00:00', 20);

INSERT INTO Memberships (MembershipName, DurationDays, Accesstime) VALUES
('Утренний PRO', 30, '06:00:00'),
('Полный день', 90, '00:00:00'),
('Вечерний PRO', 30, '17:00:00'),
('Интенсивы', 14, '08:00:00'),
('Годовой PRO', 365, '05:00:00'),
('Ночной доступ', 30, '22:00:00'),
('Уикенд PRO', 60, '08:00:00'),
('Корпоративный', 180, '00:00:00'),
('Студенческий', 90, '10:00:00'),
('VIP доступ', 365, '00:00:00');

INSERT INTO Clients (FirstName, LastName, DateOfBirth, Phone, Email, RegistrationDate) VALUES
('Ирина', 'Соколова', '1998-12-05', '79170000001', 'sokol@mail.com', '2025-01-05'),
('Глеб', 'Крутов', '2001-04-22', '79170000002', 'krytoi@mail.com', '2025-01-12'),
('Полина', 'Ветрова', '1995-08-17', '79170000003', 'windy@mail.com', '2025-01-19'),
('Станислав', 'Морозов', '1989-02-28', '79170000004', 'frost@mail.com', '2025-01-26'),
('Алиса', 'Медведева', '2003-07-14', '79170000005', 'alice@mail.com', '2025-02-02'),
('Андрей', 'Смирнов', '1990-05-10', '79170000006', 'a.smirnov@mail.com', '2025-02-10'),
('Мария', 'Ковалева', '1985-09-15', '79170000007', 'm.kovaleva@mail.com', '2025-02-12'),
('Денис', 'Павлов', '2000-03-25', '79170000008', 'd.pavlov@mail.com', '2025-02-18'),
('Екатерина', 'Никитина', '1993-11-30', '79170000009', 'e.nikitina@mail.com', '2025-02-20'),
('Артур', 'Жуков', '1997-07-07', '79170000010', 'a.zhukov@mail.com', '2025-02-25');

INSERT INTO Enrollments (ClientID, ScheduledID, ClubID, MembershipID, EnrollmentDate) VALUES
(1, 1, 2, 1, '2025-01-01'),
(2, 2, 1, 2, '2025-01-10'),
(3, 3, 3, 3, '2025-01-20'),
(4, 4, 4, 4, '2025-02-05'),
(5, 5, 5, 5, '2025-02-15'),
(6, 6, 6, 6, '2025-03-01'),
(7, 7, 7, 7, '2025-03-05'),
(8, 8, 8, 8, '2025-03-10'),
(9, 9, 9, 9, '2025-03-15'),
(10, 10, 10, 10, '2025-03-20');

-- Триггеры

-- 1 Вывод выбранных столбцов из таблицы Clients
SELECT FirstName, LastName, Email 
FROM Clients;

-- 2 Фильтрация клиентов по февралю 2025 года
SELECT * 
FROM Clients 
WHERE 
    YEAR(RegistrationDate) = 2025 
    AND MONTH(RegistrationDate) = 02;

-- 3 Сортировка клиентов по дате регистрации
SELECT FirstName, LastName, DateOfBirth 
FROM Clients 
ORDER BY RegistrationDate ASC;

-- 3 Сортировка групп по продолжительности
SELECT GroupName, Duration 
FROM Groups 
ORDER BY Duration DESC;

-- 4 Проверка валидности email при вставке клиента
DELIMITER $$
CREATE TRIGGER trg_check_client_email
BEFORE INSERT ON Clients
FOR EACH ROW
BEGIN
    IF NEW.Email NOT LIKE '%@%._%' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Некорректный формат email';
    END IF;
END$$
DELIMITER ;

-- 4 Проверка дублирования записей в расписании
DELIMITER $$
CREATE TRIGGER trg_prevent_duplicate_enrollment
BEFORE INSERT ON Enrollments
FOR EACH ROW
BEGIN
    IF EXISTS (
        SELECT 1 
        FROM Enrollments 
        WHERE 
            ClientID = NEW.ClientID 
            AND ScheduledID = NEW.ScheduledID
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Клиент уже записан на это занятие';
    END IF;
END$$
DELIMITER ;

-- 4 Проверка даты записи на занятие
DELIMITER $$
CREATE TRIGGER trg_check_enrollment_date
BEFORE INSERT ON Enrollments
FOR EACH ROW
BEGIN
    IF NEW.EnrollmentDate < CURDATE() THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Дата записи не может быть в прошлом';
    END IF;
END$$
DELIMITER ;

-- 1 Объединение таблиц. Схема данных (UNION)
-- Объединение списка клиентов и тренеров с указанием типа
SELECT FirstName, LastName, 'Client' AS Type 
FROM Clients
UNION
SELECT FirstName, LastName, 'Trainer' 
FROM Trainers
ORDER BY LastName, FirstName;

-- 2 Соединение таблиц (JOIN)
-- Получение расписания тренировок с информацией о группе, тренере и специализации
SELECT 
    s.DateTime,
    g.GroupName,
    t.FirstName AS TrainerFirstName,
    t.LastName AS TrainerLastName,
    sp.SpecializationName
FROM Schedule s
JOIN Groups g ON s.GroupID = g.GroupID
JOIN Trainers t ON g.TrainerID = t.TrainerID
JOIN Specializations sp ON t.SpecializationID = sp.SpecializationID;

-- 3 Вложенные запросы. Подзапросы
-- Полная информация о записях клиентов
SELECT 
    c.FirstName,
    c.LastName,
    cl.ClubName,
    m.MembershipName,
    s.DateTime AS TrainingTime
FROM Enrollments e
JOIN Clients c ON e.ClientID = c.ClientID
JOIN Clubs cl ON e.ClubID = cl.ClubID
JOIN Memberships m ON e.MembershipID = m.MembershipID
LEFT JOIN Schedule s ON e.ScheduledID = s.ScheduledID;

-- Количество записей по каждому клубу
SELECT 
    cl.ClubName,
    COUNT(e.EnrollmentID) AS TotalEnrollments
FROM Clubs cl
LEFT JOIN Enrollments e ON cl.ClubID = e.ClubID
GROUP BY cl.ClubName;

