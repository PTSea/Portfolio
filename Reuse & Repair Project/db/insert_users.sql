INSERT INTO Role (role_name) VALUES ('Master admin'), ('Content management admin'), ('Business admin'), ('Read-only admin');

INSERT INTO Admin (username, password, first_name, last_name, fk_role_id, email) VALUES ('briantiegs', '$2y$10$ZnfDVEGrckXL/OZul7k90uvAikkybO4NusL29gVbdJ6wvvJ6mKrK.', 'Brian', 'Tiegs', 1, 'tiegsb@oregonstate.edu');
INSERT INTO Admin (username, password, first_name, last_name, fk_role_id, email) VALUES ('philiptan', '$2y$10$ZnfDVEGrckXL/OZul7k90uvAikkybO4NusL29gVbdJ6wvvJ6mKrK.', 'Philip', 'Tan', 1, 'tanp@oregonstate.edu');
INSERT INTO Admin (username, password, first_name, last_name, fk_role_id, email) VALUES ('kaylafitzsimmons', '$2y$10$ZnfDVEGrckXL/OZul7k90uvAikkybO4NusL29gVbdJ6wvvJ6mKrK.', 'Kayla', 'Fitzsimmons', 1, 'fitzsimk@oregonstate.edu');
INSERT INTO Admin (username, password, first_name, last_name, fk_role_id, email) VALUES ('master', '$2y$10$ZnfDVEGrckXL/OZul7k90uvAikkybO4NusL29gVbdJ6wvvJ6mKrK.', 'Master', '', 1, '');
