'''This module will fill database with fake data'''
from random import randint
from datetime import datetime
import sqlite3
import faker

NUMBER_OF_STUDENTS: int = randint(30, 50)
NUMBER_OF_GROUPS: int = 3
NUMBER_OF_LECTURERS: int = randint(3, 5)
NUMBER_OF_SUBJECTS: int = randint(5, 8)
NUMBER_OF_MARKS: int = 20


def generate_fake_data(
            number_of_students: int,
            number_of_groups: int,
            number_of_lecturers: int,
            number_of_subjects: int,
            number_of_marks: int
        ) -> tuple:
    '''
    Generate fake data for students, groups,
    lecturers, subjects and marks
    
    :param number_of_students: int
    :param number_of_groups: int
    :param number_of_lecturers: int
    :param number_of_subjects: int
    :param number_of_marks: int
    :return: tuple
    '''

    fake_data = faker.Faker()

    fake_students = [fake_data.name() for _ in range(number_of_students)]
    fake_groups = [fake_data.word() for _ in range(number_of_groups)]
    fake_lecturers = [fake_data.name() for _ in range(number_of_lecturers)]
    fake_subjects = [fake_data.word() for _ in range(number_of_subjects)]

    # fake_marks = []
    # for student_id in range(1, number_of_students + 1):
    #     for _ in range(1, randint(1, number_of_marks) + 1):
    #         fake_marks.append(
    #             (
    #                 fake_data.random_int(min=1, max=100),
    #                 fake_data.date_this_year(),
    #                 student_id,
    #                 randint(1, number_of_subjects)
    #             )
    #         )

    # inline version of the above code
    fake_marks = [
        (
            fake_data.random_int(min=1, max=100),
            fake_data.date_this_year(),
            student_id,
            randint(1, number_of_subjects)
        )
        for student_id in range(1, number_of_students + 1)
        for _ in range(1, randint(1, number_of_marks) + 1)
    ]

    return fake_students, fake_groups, fake_lecturers, fake_subjects, fake_marks


def prepare_data(
            students: list[str],
            groups: list[str],
            lecturers: list[str],
            subjects: list[str],
            marks: list[tuple[int, datetime, int, int]]
        ) -> tuple:
    '''
    Prepare data for inserting to database

    :param students: list[str]
    :param groups: list[str]
    :param lecturers: list[str]
    :param subjects: list[str]
    :param marks: list[tuple[int, datetime, int, int]]
    :return: tuple
    '''

    for_students = [
        (student, randint(1, NUMBER_OF_GROUPS))
        for student in students
    ]

    for_groups = [(group, ) for group in groups]

    for_lecturers = [(lecturer, ) for lecturer in lecturers]

    for_subjects = [
        (subj, randint(1, NUMBER_OF_LECTURERS))
        for subj in subjects
    ]

    return for_students, for_groups, for_lecturers, for_subjects, marks


def insert_data_to_db(
            students: list[tuple[str, int]],
            groups: list[tuple[str]],
            lecturers: list[tuple[str]],
            subjects: list[tuple[str, int]],
            marks: list[tuple[int, datetime, int, int]]
        ) -> None:
    '''
    Insert data to database

    :param students: list
    :param groups: list
    :param lecturers: list
    :param subjects: list
    :param marks: list
    :return: None
    '''

    data_to_insert = {
        'students': students,
        'groups': groups,
        'lecturers': lecturers,
        'subjects': subjects,
        'marks': marks
    }

    sql_to_insert = {
        'students': 'INSERT INTO students(full_name, group_fk) VALUES(?, ?)',
        'groups': 'INSERT INTO groups(group_name) VALUES(?)',
        'lecturers': 'INSERT INTO lecturers(full_name) VALUES(?)',
        'subjects': 'INSERT INTO subjects(subject_name, lecturer_fk) VALUES(?, ?)',
        'marks': 'INSERT INTO marks(mark, date, student_fk, subject_fk) VALUES(?, ?, ?, ?)'
    }

    with sqlite3.connect('HW6.sqlite') as conn:
        cursor = conn.cursor()

        for item_name in sql_to_insert.keys():
            cursor.executemany(
                sql_to_insert[item_name], data_to_insert[item_name]
            )

        conn.commit()


if __name__ == '__main__':
    students, groups, lecturers, subjects, marks = prepare_data(
        *generate_fake_data(
            NUMBER_OF_STUDENTS,
            NUMBER_OF_GROUPS,
            NUMBER_OF_LECTURERS,
            NUMBER_OF_SUBJECTS,
            NUMBER_OF_MARKS
        )
    )

    insert_data_to_db(students, groups, lecturers, subjects, marks)
