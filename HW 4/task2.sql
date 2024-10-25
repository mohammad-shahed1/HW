-- Task 2: Update Statements

-- Insert new events for Fluffy and Hammy
INSERT INTO petEvent (petname, eventdate, eventtype, remark)
VALUES
    ('Fluffy', '2020-10-15', 'vet', 'antibiotics'),
    ('Hammy', '2020-10-15', 'vet', 'antibiotics');

-- Hammy's details
INSERT INTO petPet (petname, owner, species, gender, birth, death)
VALUES
    ('Hammy', 'Diane', 'hamster', 'M', '2010-10-30', NULL);

-- Update Fluffy's kitten count
-- Assuming you want to add a remark about the kittens in the event table
INSERT INTO petEvent (petname, eventdate, eventtype, remark)
VALUES
    ('Fluffy', '2020-10-15', 'litter', 'Fluffy had 5 kittens, 2 of which are male');

-- Insert event for Claws breaking a rib
INSERT INTO petEvent (petname, eventdate, eventtype, remark)
VALUES
    ('Claws', '1997-08-03', 'vet', 'broken rib');

-- Update Puffball's death date
UPDATE petPet
SET death = '2020-09-01'
WHERE petname = 'Puffball';

-- Delete Harold's dog due to GDPR request
DELETE FROM petPet
WHERE owner = 'Harold' AND species = 'dog';
