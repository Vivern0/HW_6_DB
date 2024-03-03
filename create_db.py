'''This module will create a database'''
import sqlite3


def create_db() -> None:
    '''Create a database with tables'''
    with open('create_tables.sql', 'r', encoding='utf-8') as fd:
        sql = fd.read()

    with sqlite3.connect('HW6.sqlite') as con:
        cur = con.cursor()
        cur.executescript(sql)


if __name__ == '__main__':
    create_db()
