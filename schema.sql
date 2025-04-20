DROP TABLE IF EXISTS Audit_Log, Budgets, Incomes, Expenses, Users;

CREATE TABLE Users (
  user_id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT,
  email TEXT,
  password TEXT,
  role TEXT
);

CREATE TABLE Apartments (
  apt_id INTEGER PRIMARY KEY AUTOINCREMENT,
  title TEXT,
  description TEXT,
  rent REAL,
  bhk TEXT,
  furnished TEXT,
  location TEXT,
  landlord_id INTEGER
);

CREATE TABLE Reviews (
  review_id INTEGER PRIMARY KEY AUTOINCREMENT,
  apt_id INTEGER,
  user_id INTEGER,
  rating INTEGER,
  comment TEXT,
  review_date TEXT
);

CREATE TABLE Questions (
  question_id INTEGER PRIMARY KEY AUTOINCREMENT,
  apt_id INTEGER,
  user_id INTEGER,
  question_text TEXT,
  answer_text TEXT,
  asked_at TEXT
);

CREATE TABLE Payments (
  payment_id INTEGER PRIMARY KEY AUTOINCREMENT,
  apt_id INTEGER,
  amount REAL,
  payment_date TEXT,
  due_date TEXT,
  status TEXT,
  method TEXT
);

CREATE TABLE Audit_Log (
  log_id INTEGER PRIMARY KEY AUTOINCREMENT,
  user_id INTEGER,
  action TEXT,
  timestamp TEXT
);
