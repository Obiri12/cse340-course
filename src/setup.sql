-- Organization Table 
SELECT * FROM organization

CREATE TABLE service_project (
    project_id SERIAL PRIMARY KEY,
    organization_id INT NOT NULL,
    title VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    location VARCHAR(255) NOT NULL,
    date DATE NOT NULL,

    CONSTRAINT fk_service_project_organization
        FOREIGN KEY (organization_id)
        REFERENCES organization(organization_id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);



SELECT * FROM service_project; 

INSERT INTO service_project (organization_id, title, description, location, date)
VALUES
(1, 'Community Playground Build', 'Constructing a safe and modern playground for local families.', 'Oakridge Neighborhood Park', '2026-08-12'),
(1, 'Youth Carpentry Workshop', 'Teaching teens basic carpentry and tool safety.', 'BrightFuture Training Center', '2026-09-03'),
(1, 'Neighborhood Home Repair Day', 'Providing free minor repairs for low-income households.', 'Eastwood Community', '2026-09-18'),
(1, 'Community Center Renovation', 'Renovating the old community center to support youth programs.', 'Riverside Community Center', '2026-10-02'),
(1, 'Shelter Bunk Construction', 'Building new bunk frames for the local homeless shelter.', 'Hope Haven Shelter', '2026-08-27');

INSERT INTO service_project (organization_id, title, description, location, date)
VALUES
(2, 'Urban Garden Expansion', 'Expanding the community garden to increase fresh produce availability.', 'Maple Street Garden', '2026-08-15'),
(2, 'Composting Education Day', 'Teaching residents how to compost and reduce waste.', 'GreenHarvest Farm Hub', '2026-09-07'),
(2, 'Farm-to-Family Produce Drive', 'Harvesting and distributing fresh vegetables to local families.', 'GreenHarvest Fields', '2026-09-21'),
(2, 'Pollinator Habitat Planting', 'Planting flowers and shrubs to support bees and butterflies.', 'Lakeside Nature Reserve', '2026-10-04'),
(2, 'Sustainable Irrigation Workshop', 'Training volunteers on water-efficient irrigation systems.', 'Community Agriculture Center', '2026-08-30');
INSERT INTO service_project (organization_id, title, description, location, date)
VALUES
(3, 'Back-to-School Supply Fair', 'Providing backpacks and supplies to students in need.', 'UnityServe Hall', '2026-08-20'),
(3, 'Warm Meals Outreach', 'Serving hot meals to unhoused community members.', 'Downtown Outreach Plaza', '2026-09-10'),
(3, 'Senior Companion Day', 'Spending time with seniors through games and conversation.', 'Golden Years Senior Home', '2026-09-25'),
(3, 'Community Wellness Expo', 'Offering free health screenings and wellness resources.', 'City Civic Center', '2026-10-06'),
(3, 'Emergency Relief Kit Assembly', 'Assembling emergency kits for families affected by disasters.', 'UnityServe Warehouse', '2026-08-28');


CREATE TABLE category (
    category_id SERIAL PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL UNIQUE
);

SELECT * FROM category; 
CREATE TABLE project_category (
    project_id INT NOT NULL,
    category_id INT NOT NULL,

    CONSTRAINT pk_project_category
        PRIMARY KEY (project_id, category_id),

    CONSTRAINT fk_project_category_project
        FOREIGN KEY (project_id)
        REFERENCES service_project(project_id)
        ON UPDATE CASCADE
        ON DELETE CASCADE,

    CONSTRAINT fk_project_category_category
        FOREIGN KEY (category_id)
        REFERENCES category(category_id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

SELECT * FROM project_category; 
INSERT INTO category (category_name) VALUES
('Environmental'),
('Educational'),
('Community Service'),
('Health and Wellness');

INSERT INTO project_category (project_id, category_id) VALUES
(1, 1), -- Project 1 → Environmental
(2, 2), -- Project 2 → Educational
(3, 3), -- Project 3 → Community Service
(4, 4); -- Project 4 → Health and Wellness

