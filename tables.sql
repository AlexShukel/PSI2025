DROP TABLE IF EXISTS learning_materials CASCADE;
DROP TABLE IF EXISTS reviews CASCADE;
DROP TABLE IF EXISTS group_reservation_attendees CASCADE;
DROP TABLE IF EXISTS group_reservations CASCADE;
DROP TABLE IF EXISTS reservations CASCADE;
DROP TABLE IF EXISTS tutor_availability_slots CASCADE;
DROP TABLE IF EXISTS teaching_offers CASCADE;
DROP TABLE IF EXISTS subjects CASCADE;
DROP TABLE IF EXISTS tutor_documents CASCADE;
DROP TABLE IF EXISTS transactions CASCADE;
DROP TABLE IF EXISTS external_auths CASCADE;
DROP TABLE IF EXISTS administrators CASCADE;
DROP TABLE IF EXISTS tutors CASCADE;
DROP TABLE IF EXISTS students CASCADE;
DROP TABLE IF EXISTS users CASCADE;

-- Enums:
-- UserRole: ADMINISTRATOR, STUDENT, TUTOR
-- ReservationStatus: WAITING_APPROVAL, APPROVED, CANCELED, COMPLETED
-- AuthProvider: GOOGLE, FACEBOOK, APPLE

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    email VARCHAR(255) NOT NULL UNIQUE,
    password_hash VARCHAR(255),
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    is_blocked BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    role VARCHAR(20) NOT NULL,
    avatar_url VARCHAR(500),
    
    CONSTRAINT chk_user_role CHECK (role IN ('ADMINISTRATOR', 'STUDENT', 'TUTOR'))
);

CREATE TABLE external_auths (
    id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL,
    provider VARCHAR(20) NOT NULL,
    external_user_id VARCHAR(255) NOT NULL,
    email VARCHAR(255),
    
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    CONSTRAINT chk_auth_provider CHECK (provider IN ('GOOGLE', 'FACEBOOK', 'APPLE')),
    UNIQUE (provider, external_user_id)
);

CREATE TABLE administrators (
    user_id INTEGER PRIMARY KEY,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

CREATE TABLE students (
    user_id INTEGER PRIMARY KEY,
    balance INTEGER DEFAULT 0,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

CREATE TABLE tutors (
    user_id INTEGER PRIMARY KEY,
    headline VARCHAR(255),
    bio TEXT,
    is_approved BOOLEAN DEFAULT FALSE,
    hourly_rate INTEGER DEFAULT 0,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

CREATE TABLE tutor_documents (
    id SERIAL PRIMARY KEY,
    tutor_id INTEGER NOT NULL,
    title VARCHAR(255) NOT NULL,
    file_url VARCHAR(500) NOT NULL,
    file_type VARCHAR(50),
    file_size INTEGER,
    uploaded_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    FOREIGN KEY (tutor_id) REFERENCES tutors(user_id) ON DELETE CASCADE
);

CREATE TABLE subjects (
    id SERIAL PRIMARY KEY,
    code VARCHAR(50) NOT NULL UNIQUE,
    description VARCHAR(255) NOT NULL
);

CREATE TABLE teaching_offers (
    id SERIAL PRIMARY KEY,
    tutor_id INTEGER NOT NULL,
    subject_id INTEGER NOT NULL,
    grade_from INTEGER,
    grade_to INTEGER,
    
    FOREIGN KEY (tutor_id) REFERENCES tutors(user_id) ON DELETE CASCADE,
    FOREIGN KEY (subject_id) REFERENCES subjects(id) ON DELETE CASCADE
);

CREATE TABLE tutor_availability_slots (
    id SERIAL PRIMARY KEY,
    tutor_id INTEGER NOT NULL,
    start_date_time TIMESTAMP NOT NULL,
    is_booked BOOLEAN DEFAULT FALSE,
    
    FOREIGN KEY (tutor_id) REFERENCES tutors(user_id) ON DELETE CASCADE
);

CREATE TABLE reservations (
    id SERIAL PRIMARY KEY,
    student_id INTEGER NOT NULL,
    tutor_id INTEGER NOT NULL,
    subject_id INTEGER NOT NULL,
    start_date_time TIMESTAMP NOT NULL,
    status VARCHAR(20) DEFAULT 'WAITING_APPROVAL',
    google_meet_link VARCHAR(500),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    FOREIGN KEY (student_id) REFERENCES students(user_id) ON DELETE CASCADE,
    FOREIGN KEY (tutor_id) REFERENCES tutors(user_id) ON DELETE CASCADE,
    FOREIGN KEY (subject_id) REFERENCES subjects(id),
    CONSTRAINT chk_res_status CHECK (status IN ('WAITING_APPROVAL', 'APPROVED', 'CANCELED', 'COMPLETED'))
);

CREATE TABLE group_reservations (
    id SERIAL PRIMARY KEY,
    tutor_id INTEGER NOT NULL,
    subject_id INTEGER NOT NULL,
    title VARCHAR(255) NOT NULL,
    start_date_time TIMESTAMP NOT NULL,
    end_date_time TIMESTAMP NOT NULL,
    max_attendees INTEGER NOT NULL,
    price_per_student INTEGER NOT NULL,
    google_meet_link VARCHAR(500),
    
    FOREIGN KEY (tutor_id) REFERENCES tutors(user_id) ON DELETE CASCADE,
    FOREIGN KEY (subject_id) REFERENCES subjects(id)
);

CREATE TABLE group_reservation_attendees (
    group_reservation_id INTEGER NOT NULL,
    student_id INTEGER NOT NULL,
    joined_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    PRIMARY KEY (group_reservation_id, student_id),
    FOREIGN KEY (group_reservation_id) REFERENCES group_reservations(id) ON DELETE CASCADE,
    FOREIGN KEY (student_id) REFERENCES students(user_id) ON DELETE CASCADE
);

CREATE TABLE reviews (
    id SERIAL PRIMARY KEY,
    student_id INTEGER NOT NULL,
    tutor_id INTEGER NOT NULL,
    rating INTEGER NOT NULL,
    comment TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    FOREIGN KEY (student_id) REFERENCES students(user_id) ON DELETE CASCADE,
    FOREIGN KEY (tutor_id) REFERENCES tutors(user_id) ON DELETE CASCADE,
    CONSTRAINT chk_rating CHECK (rating >= 0 AND rating <= 5)
);

CREATE TABLE learning_materials (
    id SERIAL PRIMARY KEY,
    reservation_id INTEGER, 
    group_reservation_id INTEGER,
    
    title VARCHAR(255) NOT NULL,
    file_url VARCHAR(500) NOT NULL,
    file_type VARCHAR(50),
    file_size INTEGER,
    uploaded_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    FOREIGN KEY (reservation_id) REFERENCES reservations(id) ON DELETE CASCADE,
    FOREIGN KEY (group_reservation_id) REFERENCES group_reservations(id) ON DELETE CASCADE,
    
    CONSTRAINT chk_material_link CHECK (reservation_id IS NOT NULL OR group_reservation_id IS NOT NULL)
);

CREATE TABLE transactions (
    id SERIAL PRIMARY KEY,
    student_id INTEGER NOT NULL,
    amount INTEGER NOT NULL,
    stripe_payment_reference VARCHAR(255),
    date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    FOREIGN KEY (student_id) REFERENCES students(user_id) ON DELETE CASCADE
);
