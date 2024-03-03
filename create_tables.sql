DROP TABLE IF EXISTS students;
CREATE TABLE students(
    id INTEGER PRIMARY KEY AUTOINCREMENT ,
    full_name varchar(100) NOT NULL,
    group_fk INTEGER,
    FOREIGN KEY (group_fk) REFERENCES groups(id)
        ON UPDATE CASCADE
        ON DELETE SET NULL
);

DROP TABLE IF EXISTS groups;
CREATE TABLE groups(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    group_name varchar(100) NOT NULL
);

DROP TABLE IF EXISTS lecturers;
CREATE TABLE lecturers(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    full_name varchar(100) NOT NULL
);

DROP TABLE IF EXISTS subjects;
CREATE TABLE subjects(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    subject_name varchar(100) NOT NULL,
    lecturer_fk INTEGER,
    FOREIGN KEY (lecturer_fk) REFERENCES lecturers(id)
    ON UPDATE CASCADE
    ON DELETE SET NULL
);

DROP TABLE IF EXISTS marks;
CREATE TABLE marks(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    mark INTEGER NOT NULL CHECK (mark BETWEEN 1 and 100), 
    date DATE,
    student_fk INTEGER NOT NULL,
    subject_fk INTEGER,
    FOREIGN KEY (student_fk) REFERENCES students(id)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    FOREIGN KEY (subject_fk) REFERENCES subjects(id)
        ON UPDATE CASCADE
        ON DELETE SET NULL
);

