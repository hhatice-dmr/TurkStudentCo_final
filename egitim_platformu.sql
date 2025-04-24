-- 1. Members Tablosu
CREATE TABLE Members (
    member_id SERIAL PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    registration_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    first_name VARCHAR(50),
    last_name VARCHAR(50)
);

-- 2. Categories Tablosu
CREATE TABLE Categories (
    category_id SERIAL PRIMARY KEY,
    category_name VARCHAR(100) UNIQUE NOT NULL
);

-- 3. Courses Tablosu
CREATE TABLE Courses (
    course_id SERIAL PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    description TEXT,
    start_date DATE,
    end_date DATE,
    instructor VARCHAR(100),
    category_id INTEGER REFERENCES Categories(category_id)
);

-- 4. Enrollments Tablosu
CREATE TABLE Enrollments (
    enrollment_id SERIAL PRIMARY KEY,
    member_id INTEGER NOT NULL REFERENCES Members(member_id),
    course_id INTEGER NOT NULL REFERENCES Courses(course_id),
    enrollment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE (member_id, course_id)
);

-- 5. Certificates Tablosu
CREATE TABLE Certificates (
    certificate_id SERIAL PRIMARY KEY,
    certificate_code VARCHAR(100) UNIQUE NOT NULL,
    issue_date DATE DEFAULT CURRENT_DATE
);

-- 6. CertificateAssignments Tablosu
CREATE TABLE CertificateAssignments (
    assignment_id SERIAL PRIMARY KEY,
    member_id INTEGER NOT NULL REFERENCES Members(member_id),
    certificate_id INTEGER NOT NULL REFERENCES Certificates(certificate_id),
    received_date DATE DEFAULT CURRENT_DATE,
    UNIQUE (member_id, certificate_id)
);

-- 7. BlogPosts Tablosu
CREATE TABLE BlogPosts (
    post_id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    content TEXT NOT NULL,
    published_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    author_id INTEGER NOT NULL REFERENCES Members(member_id)
);
