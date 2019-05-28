CREATE TABLE Resource (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT unique,
        value TEXT);

CREATE TABLE Record (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT,
        content TEXT);
