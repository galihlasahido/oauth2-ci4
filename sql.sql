-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: db-mysql8
-- Generation Time: Jul 10, 2023 at 09:24 PM
-- Server version: 8.0.27
-- PHP Version: 7.4.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `isales`
--

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `access_token` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `client_id` varchar(80) NOT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `expires` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `scope` varchar(2000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_authorization_codes`
--

CREATE TABLE `oauth_authorization_codes` (
  `authorization_code` varchar(40) NOT NULL,
  `client_id` varchar(80) NOT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `redirect_uri` varchar(2000) DEFAULT NULL,
  `expires` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `scope` varchar(2000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `client_id` varchar(80) NOT NULL,
  `client_secret` varchar(80) NOT NULL,
  `redirect_uri` varchar(2000) NOT NULL,
  `grant_types` varchar(80) DEFAULT NULL,
  `scope` varchar(100) DEFAULT NULL,
  `user_id` varchar(80) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`client_id`, `client_secret`, `redirect_uri`, `grant_types`, `scope`, `user_id`) VALUES
('client2', 'pass2', 'http://localhost', 'authorization_code', 'file node userinfo cloud', 'xiaocao'),
('testclient', 'testpass', 'http://localhost', 'client_credentials authorization_code refresh_token password', 'file node userinfo cloud', 'xiaocao');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_jwt`
--

CREATE TABLE `oauth_jwt` (
  `client_id` varchar(80) NOT NULL,
  `subject` varchar(80) DEFAULT NULL,
  `public_key` varchar(2000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_public_keys`
--

CREATE TABLE `oauth_public_keys` (
  `client_id` varchar(80) DEFAULT NULL,
  `public_key` varchar(8000) DEFAULT NULL,
  `private_key` varchar(8000) DEFAULT NULL,
  `encryption_algorithm` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT 'RS512'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `oauth_public_keys`
--

INSERT INTO `oauth_public_keys` (`client_id`, `public_key`, `private_key`, `encryption_algorithm`) VALUES
(NULL, '-----BEGIN PUBLIC KEY-----\r\nMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAy659sEIFu1w3e7zw+Y8f\r\ntL6sgV5RIiEov7ST+vdwTr/Yo0kvzXugSSKpWYC0Ks9sp9EXo/sFKw041/q7Du+8\r\nY5dUoUOP5Faag7bCZz0lwZLNCc9ZA4tXi2fgxrDaKlVo5SJ8yOy0/YWVZvZz1q3H\r\nnDMPEtKWbVYXxllL7dR9HSaBEoEJ9W3S5zEZFw5Ef0iyfxdp6gu5zAQZIGfF3TaD\r\npJYw0VPGVYdLQEI+Aw1Cgpx9OwANd+ZgyEpsaqFZ0M3mpcjnTguiWw9iDgscF0/W\r\n+hawJH6wOFuQ6QRJrEQb2Cw7JWpoFcwspyDNDYW4sUPJ9rcK8QqzXdi+Ka7+JvNR\r\nLQIDAQAB\r\n-----END PUBLIC KEY-----', '-----BEGIN RSA PRIVATE KEY-----\r\nMIIEowIBAAKCAQEAy659sEIFu1w3e7zw+Y8ftL6sgV5RIiEov7ST+vdwTr/Yo0kv\r\nzXugSSKpWYC0Ks9sp9EXo/sFKw041/q7Du+8Y5dUoUOP5Faag7bCZz0lwZLNCc9Z\r\nA4tXi2fgxrDaKlVo5SJ8yOy0/YWVZvZz1q3HnDMPEtKWbVYXxllL7dR9HSaBEoEJ\r\n9W3S5zEZFw5Ef0iyfxdp6gu5zAQZIGfF3TaDpJYw0VPGVYdLQEI+Aw1Cgpx9OwAN\r\nd+ZgyEpsaqFZ0M3mpcjnTguiWw9iDgscF0/W+hawJH6wOFuQ6QRJrEQb2Cw7JWpo\r\nFcwspyDNDYW4sUPJ9rcK8QqzXdi+Ka7+JvNRLQIDAQABAoIBADueXJ3uBV19NaRb\r\nfrGdqisusLHBWMBDsnjCs5n/OXljgFbzQjHEYPtnUOio2pO5WVWZx3CxNicO3Lej\r\nZYOOurbwAc6eRw0QKHQrV6X+aQHLJYcckTKPY9WjV1DxTTqc+3IucRYi6ytWIZAc\r\nzXVmMopPC7d3up5QV+8wDiCUVPbl228k8w5hZ4jLHe8NvV5QwD9Ed1f2XYjl2IPy\r\n4taqN+v9EtTNH7o8IajFHmXQrhLOxm05VVqOt2gu1pl37VIjGmF8MA4wnKg1GGem\r\nPmnVzDE4oka0Xa/BygyOLt2Bj7ggazlypUqj3emrYv739S1db9lxl081Ilrb3hHD\r\nRMYvAqUCgYEA8qOgpYXLvXFKiOGBYib8aj1De1GY2IEcIFUflAQ2u4fO8KHkPOfi\r\n0sc9K+ff1uDcNBBJyslyO6Xxf9t3OBA0CX5EOL2VUXd4xSBAVj2PEIUqxqEK05kA\r\nQ7FD8Hh6Csc9rjhf1VRmQck6VC9uWwrXo5BIM85zcP6zxDQEzTsrx2MCgYEA1uWy\r\nVeYXhbQ2uzR5RkXMzUgGGgPQee5P+npx8PFd2271M1J+dobadADgWyG3K6l63+MQ\r\npx5WpxqamTOLCKY2RoUS08P6mFrNyXp3ziMKsZJBqVUHkvSjnyAuRE7VkTJz+Hnt\r\ngtFKQkihe3A8ECMcgNeAI5QtyPiOq8MRn0eEUi8CgYBMPArqVqpX4DOJ5EhRfWxL\r\nOOpt4YpDY/VhVz1vtQ85RodHZaYfWMAUd5MJq3XRvp6RIRj+ROLGSPIiuOKxU631\r\n2Z03sqEqkn34eZSdRAQiLaTt+YU8TFMf8Z8l+8RkhIslpQK/NSBXxRC1iJ2Er1hn\r\nRJra5B+zPeNfXvSvQssTfwKBgHF+VjUvk/S1PMKZ8ALBEmzIQRC0OwJqbirnSA3s\r\nK5mcfDtisg9/IRhq7hKzN74DgDWGAmGAkFsoncWThzZGMhwEY/Eba9nS+yQRXfys\r\nXRVzHOKFWb6vHUsI/+ZrjDdm4gC0xE92oTVojoBWwiHzqTYSmkYwGA4v14m3ODNa\r\n3fNZAoGBAOnbylKmED+sddFoBM5lZoob9hQ4909yG04tCDOz9Vfo8rkLx8Rwwg67\r\n1M9fUluChDrcHlPVx5CuBc1o5h50zsKW9iNHtZqU6+PSMSRz3X5f2ZPpPro5b9V5\r\npFMhOgb6/+jZu6LmGzHmLa80Wz6DfCK3mOEdFlB//YD2dH1FKdDb\r\n-----END RSA PRIVATE KEY-----', 'RS512');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `refresh_token` varchar(40) NOT NULL,
  `client_id` varchar(80) NOT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `expires` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `scope` varchar(2000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_scopes`
--

CREATE TABLE `oauth_scopes` (
  `scope` text,
  `is_default` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `oauth_scopes`
--

INSERT INTO `oauth_scopes` (`scope`, `is_default`) VALUES
('userinfo', 1),
('file', 1),
('node', 1),
('cloud', 1),
('share', 1);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_users`
--

CREATE TABLE `oauth_users` (
  `username` varchar(255) NOT NULL,
  `password` varchar(2000) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `oauth_users`
--

INSERT INTO `oauth_users` (`username`, `password`, `first_name`, `last_name`) VALUES
('user', '$2a$12$265Nhnr.cLc7z1ld8A.x/uqX3DzofkTfRTnP3vQXowW0Fm7UcPmtO', 'user', 'user'),
('username', '$2a$12$wxFNXmJQtg07BDjQmba76.Gv4xKhyhNvphH5MUErUFAvZUqx/Qmt6', 'username', 'username');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`access_token`);

--
-- Indexes for table `oauth_authorization_codes`
--
ALTER TABLE `oauth_authorization_codes`
  ADD PRIMARY KEY (`authorization_code`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`client_id`);

--
-- Indexes for table `oauth_jwt`
--
ALTER TABLE `oauth_jwt`
  ADD PRIMARY KEY (`client_id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`refresh_token`);

--
-- Indexes for table `oauth_users`
--
ALTER TABLE `oauth_users`
  ADD PRIMARY KEY (`username`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
