
CREATE Table admin (
  id INTEGER PRIMARY KEY AUTO_INCREMENT,
  username VARCHAR(255),
  password VARCHAR(255)
);

INSERT INTO admin (username, password) VALUES ('admin', '$2a$11$w/qzDPEf6NETEqz9A1gNt.OMHEcPjuljgQ.g9WnpckVaGIQcJtB9i');
CREATE TABLE events (
  id INTEGER PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(255),
  description VARCHAR(255),
  start_datetime VARCHAR(255),
  end_datetime VARCHAR(255),
  location VARCHAR(255),
  image_url VARCHAR(255),
  famous_person VARCHAR(255),
  free_food VARCHAR(255), 
  is_active TINYINT(1) DEFAULT 1
);