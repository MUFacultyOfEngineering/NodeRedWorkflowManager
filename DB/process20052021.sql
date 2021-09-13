-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 20, 2021 at 03:51 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 7.3.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `process`
--

-- --------------------------------------------------------

--
-- Table structure for table `active_task`
--

CREATE TABLE `active_task` (
  `id` int(11) NOT NULL,
  `bpmn_id` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  `status` varchar(20) NOT NULL,
  `instance_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `active_task`
--

INSERT INTO `active_task` (`id`, `bpmn_id`, `name`, `type`, `status`, `instance_id`) VALUES
(1, 'startevent1', 'Start', 'startEvent', 'Ready_To_Start', 1),
(2, 'startevent1', 'Start', 'startEvent', 'Ready_To_Start', 2),
(3, 'startevent1', 'Start', 'startEvent', 'Ready_To_Start', 2),
(4, 'startevent1', 'Start', 'startEvent', 'Ready_To_Start', 2),
(5, 'startevent1', 'Start', 'startEvent', 'Ready_To_Start', 2),
(6, 'startevent1', 'Start', 'startEvent', 'Ready_To_Start', 2),
(7, 'startevent1', 'Start', 'startEvent', 'Ready_To_Start', 2),
(8, 'startevent1', 'Start', 'startEvent', 'Ready_To_Start', 2),
(9, 'startevent1', 'Start', 'startEvent', 'Ready_To_Start', 18),
(10, 'startevent1', 'Start', 'startEvent', 'Ready_To_Start', 19);

-- --------------------------------------------------------

--
-- Table structure for table `process`
--

CREATE TABLE `process` (
  `id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `recipe` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `process`
--

INSERT INTO `process` (`id`, `name`, `recipe`) VALUES
(6, 'My process', '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.activiti.org/test\">\r\n  <process id=\"myProcess\" name=\"My process\" isExecutable=\"true\">\r\n    <startEvent id=\"startevent1\" name=\"Start\"></startEvent>\r\n    <endEvent id=\"endevent1\" name=\"End\"></endEvent>\r\n    <serviceTask id=\"servicetask2\" name=\"REST Task (POST)\" activiti:class=\"org.wso2.carbon.bpmn.extensions.rest.RESTTask\" activiti:extensionId=\"org.wso2.integrationstudio.bpmn.extensions.restTask.RESTTask\">\r\n      <extensionElements>\r\n        <activiti:field name=\"serviceURL\">\r\n          <activiti:string>http://localhost/Pelotari/resources/cuadro/post2</activiti:string>\r\n        </activiti:field>\r\n        <activiti:field name=\"method\">\r\n          <activiti:string>POST</activiti:string>\r\n        </activiti:field>\r\n        <activiti:field name=\"input\">\r\n          <activiti:string>{\"id\": 4,\"nombre\": \"Danel\",\"apellido\": \"Elezkano\",\"posicion\": \"Delantero\",\"edad\": 26,\"ganados\": 9,\"perdidos\": 1}</activiti:string>\r\n        </activiti:field>\r\n      </extensionElements>\r\n    </serviceTask>\r\n    <sequenceFlow id=\"flow1\" sourceRef=\"startevent1\" targetRef=\"servicetask2\"></sequenceFlow>\r\n    <parallelGateway id=\"parallelgateway1\" name=\"Parallel Gateway\"></parallelGateway>\r\n    <sequenceFlow id=\"flow2\" sourceRef=\"servicetask2\" targetRef=\"parallelgateway1\"></sequenceFlow>\r\n    <serviceTask id=\"servicetask3\" name=\"REST Task (GET)\" activiti:class=\"org.wso2.carbon.bpmn.extensions.rest.RESTTask\" activiti:extensionId=\"org.wso2.integrationstudio.bpmn.extensions.restTask.RESTTask\">\r\n      <extensionElements>\r\n        <activiti:field name=\"serviceURL\">\r\n          <activiti:string>http://localhost/Pelotari/resources/cuadro</activiti:string>\r\n        </activiti:field>\r\n        <activiti:field name=\"method\">\r\n          <activiti:string>GET</activiti:string>\r\n        </activiti:field>\r\n      </extensionElements>\r\n    </serviceTask>\r\n    <serviceTask id=\"servicetask4\" name=\"REST Task (Asyn)\" activiti:async=\"true\" activiti:class=\"org.wso2.carbon.bpmn.extensions.rest.RESTTask\" activiti:extensionId=\"org.wso2.integrationstudio.bpmn.extensions.restTask.RESTTask\">\r\n      <extensionElements>\r\n        <activiti:field name=\"serviceURL\">\r\n          <activiti:string>http://localhost/Pelotari/resources/cuadro/put/:id/:nombre/:apellido/:posicion/:edad/:ganados/:perdidos</activiti:string>\r\n        </activiti:field>\r\n        <activiti:field name=\"method\">\r\n          <activiti:string>PUT</activiti:string>\r\n        </activiti:field>\r\n      </extensionElements>\r\n    </serviceTask>\r\n    <sequenceFlow id=\"flow3\" sourceRef=\"parallelgateway1\" targetRef=\"servicetask3\"></sequenceFlow>\r\n    <sequenceFlow id=\"flow4\" sourceRef=\"parallelgateway1\" targetRef=\"servicetask4\"></sequenceFlow>\r\n    <parallelGateway id=\"parallelgateway2\" name=\"Parallel Gateway\"></parallelGateway>\r\n    <sequenceFlow id=\"flow5\" sourceRef=\"servicetask3\" targetRef=\"parallelgateway2\"></sequenceFlow>\r\n    <sequenceFlow id=\"flow6\" sourceRef=\"servicetask4\" targetRef=\"parallelgateway2\"></sequenceFlow>\r\n    <sequenceFlow id=\"flow7\" sourceRef=\"parallelgateway2\" targetRef=\"endevent1\"></sequenceFlow>\r\n  </process>\r\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_myProcess\">\r\n    <bpmndi:BPMNPlane bpmnElement=\"myProcess\" id=\"BPMNPlane_myProcess\">\r\n      <bpmndi:BPMNShape bpmnElement=\"startevent1\" id=\"BPMNShape_startevent1\">\r\n        <omgdc:Bounds height=\"35.0\" width=\"35.0\" x=\"150.0\" y=\"170.0\"></omgdc:Bounds>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"endevent1\" id=\"BPMNShape_endevent1\">\r\n        <omgdc:Bounds height=\"35.0\" width=\"35.0\" x=\"840.0\" y=\"160.0\"></omgdc:Bounds>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"servicetask2\" id=\"BPMNShape_servicetask2\">\r\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"260.0\" y=\"160.0\"></omgdc:Bounds>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"parallelgateway1\" id=\"BPMNShape_parallelgateway1\">\r\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"410.0\" y=\"167.0\"></omgdc:Bounds>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"servicetask3\" id=\"BPMNShape_servicetask3\">\r\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"530.0\" y=\"100.0\"></omgdc:Bounds>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"servicetask4\" id=\"BPMNShape_servicetask4\">\r\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"530.0\" y=\"240.0\"></omgdc:Bounds>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"parallelgateway2\" id=\"BPMNShape_parallelgateway2\">\r\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"730.0\" y=\"158.0\"></omgdc:Bounds>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNEdge bpmnElement=\"flow1\" id=\"BPMNEdge_flow1\">\r\n        <omgdi:waypoint x=\"185.0\" y=\"187.0\"></omgdi:waypoint>\r\n        <omgdi:waypoint x=\"260.0\" y=\"187.0\"></omgdi:waypoint>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"flow2\" id=\"BPMNEdge_flow2\">\r\n        <omgdi:waypoint x=\"365.0\" y=\"187.0\"></omgdi:waypoint>\r\n        <omgdi:waypoint x=\"410.0\" y=\"187.0\"></omgdi:waypoint>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"flow3\" id=\"BPMNEdge_flow3\">\r\n        <omgdi:waypoint x=\"430.0\" y=\"167.0\"></omgdi:waypoint>\r\n        <omgdi:waypoint x=\"430.0\" y=\"127.0\"></omgdi:waypoint>\r\n        <omgdi:waypoint x=\"530.0\" y=\"127.0\"></omgdi:waypoint>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"flow4\" id=\"BPMNEdge_flow4\">\r\n        <omgdi:waypoint x=\"430.0\" y=\"207.0\"></omgdi:waypoint>\r\n        <omgdi:waypoint x=\"430.0\" y=\"267.0\"></omgdi:waypoint>\r\n        <omgdi:waypoint x=\"530.0\" y=\"267.0\"></omgdi:waypoint>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"flow5\" id=\"BPMNEdge_flow5\">\r\n        <omgdi:waypoint x=\"635.0\" y=\"127.0\"></omgdi:waypoint>\r\n        <omgdi:waypoint x=\"750.0\" y=\"127.0\"></omgdi:waypoint>\r\n        <omgdi:waypoint x=\"750.0\" y=\"158.0\"></omgdi:waypoint>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"flow6\" id=\"BPMNEdge_flow6\">\r\n        <omgdi:waypoint x=\"635.0\" y=\"267.0\"></omgdi:waypoint>\r\n        <omgdi:waypoint x=\"750.0\" y=\"267.0\"></omgdi:waypoint>\r\n        <omgdi:waypoint x=\"750.0\" y=\"198.0\"></omgdi:waypoint>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"flow7\" id=\"BPMNEdge_flow7\">\r\n        <omgdi:waypoint x=\"770.0\" y=\"178.0\"></omgdi:waypoint>\r\n        <omgdi:waypoint x=\"840.0\" y=\"177.0\"></omgdi:waypoint>\r\n      </bpmndi:BPMNEdge>\r\n    </bpmndi:BPMNPlane>\r\n  </bpmndi:BPMNDiagram>\r\n</definitions>'),
(7, 'My process', '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.activiti.org/test\">\r\n  <process id=\"myProcess\" name=\"My process\" isExecutable=\"true\">\r\n    <startEvent id=\"startevent1\" name=\"Start\"></startEvent>\r\n    <endEvent id=\"endevent1\" name=\"End\"></endEvent>\r\n    <serviceTask id=\"servicetask2\" name=\"REST Task (POST)\" activiti:class=\"org.wso2.carbon.bpmn.extensions.rest.RESTTask\" activiti:extensionId=\"org.wso2.integrationstudio.bpmn.extensions.restTask.RESTTask\">\r\n      <extensionElements>\r\n        <activiti:field name=\"serviceURL\">\r\n          <activiti:string>http://localhost/Pelotari/resources/cuadro/post2</activiti:string>\r\n        </activiti:field>\r\n        <activiti:field name=\"method\">\r\n          <activiti:string>POST</activiti:string>\r\n        </activiti:field>\r\n        <activiti:field name=\"input\">\r\n          <activiti:string>{\"id\": 4,\"nombre\": \"Danel\",\"apellido\": \"Elezkano\",\"posicion\": \"Delantero\",\"edad\": 26,\"ganados\": 9,\"perdidos\": 1}</activiti:string>\r\n        </activiti:field>\r\n      </extensionElements>\r\n    </serviceTask>\r\n    <sequenceFlow id=\"flow1\" sourceRef=\"startevent1\" targetRef=\"servicetask2\"></sequenceFlow>\r\n    <parallelGateway id=\"parallelgateway1\" name=\"Parallel Gateway\"></parallelGateway>\r\n    <sequenceFlow id=\"flow2\" sourceRef=\"servicetask2\" targetRef=\"parallelgateway1\"></sequenceFlow>\r\n    <serviceTask id=\"servicetask3\" name=\"REST Task (GET)\" activiti:class=\"org.wso2.carbon.bpmn.extensions.rest.RESTTask\" activiti:extensionId=\"org.wso2.integrationstudio.bpmn.extensions.restTask.RESTTask\">\r\n      <extensionElements>\r\n        <activiti:field name=\"serviceURL\">\r\n          <activiti:string>http://localhost/Pelotari/resources/cuadro</activiti:string>\r\n        </activiti:field>\r\n        <activiti:field name=\"method\">\r\n          <activiti:string>GET</activiti:string>\r\n        </activiti:field>\r\n      </extensionElements>\r\n    </serviceTask>\r\n    <serviceTask id=\"servicetask4\" name=\"REST Task (Asyn)\" activiti:async=\"true\" activiti:class=\"org.wso2.carbon.bpmn.extensions.rest.RESTTask\" activiti:extensionId=\"org.wso2.integrationstudio.bpmn.extensions.restTask.RESTTask\">\r\n      <extensionElements>\r\n        <activiti:field name=\"serviceURL\">\r\n          <activiti:string>http://localhost/Pelotari/resources/cuadro/put/:id/:nombre/:apellido/:posicion/:edad/:ganados/:perdidos</activiti:string>\r\n        </activiti:field>\r\n        <activiti:field name=\"method\">\r\n          <activiti:string>PUT</activiti:string>\r\n        </activiti:field>\r\n      </extensionElements>\r\n    </serviceTask>\r\n    <sequenceFlow id=\"flow3\" sourceRef=\"parallelgateway1\" targetRef=\"servicetask3\"></sequenceFlow>\r\n    <sequenceFlow id=\"flow4\" sourceRef=\"parallelgateway1\" targetRef=\"servicetask4\"></sequenceFlow>\r\n    <parallelGateway id=\"parallelgateway2\" name=\"Parallel Gateway\"></parallelGateway>\r\n    <sequenceFlow id=\"flow5\" sourceRef=\"servicetask3\" targetRef=\"parallelgateway2\"></sequenceFlow>\r\n    <sequenceFlow id=\"flow6\" sourceRef=\"servicetask4\" targetRef=\"parallelgateway2\"></sequenceFlow>\r\n    <sequenceFlow id=\"flow7\" sourceRef=\"parallelgateway2\" targetRef=\"endevent1\"></sequenceFlow>\r\n  </process>\r\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_myProcess\">\r\n    <bpmndi:BPMNPlane bpmnElement=\"myProcess\" id=\"BPMNPlane_myProcess\">\r\n      <bpmndi:BPMNShape bpmnElement=\"startevent1\" id=\"BPMNShape_startevent1\">\r\n        <omgdc:Bounds height=\"35.0\" width=\"35.0\" x=\"150.0\" y=\"170.0\"></omgdc:Bounds>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"endevent1\" id=\"BPMNShape_endevent1\">\r\n        <omgdc:Bounds height=\"35.0\" width=\"35.0\" x=\"840.0\" y=\"160.0\"></omgdc:Bounds>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"servicetask2\" id=\"BPMNShape_servicetask2\">\r\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"260.0\" y=\"160.0\"></omgdc:Bounds>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"parallelgateway1\" id=\"BPMNShape_parallelgateway1\">\r\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"410.0\" y=\"167.0\"></omgdc:Bounds>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"servicetask3\" id=\"BPMNShape_servicetask3\">\r\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"530.0\" y=\"100.0\"></omgdc:Bounds>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"servicetask4\" id=\"BPMNShape_servicetask4\">\r\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"530.0\" y=\"240.0\"></omgdc:Bounds>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"parallelgateway2\" id=\"BPMNShape_parallelgateway2\">\r\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"730.0\" y=\"158.0\"></omgdc:Bounds>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNEdge bpmnElement=\"flow1\" id=\"BPMNEdge_flow1\">\r\n        <omgdi:waypoint x=\"185.0\" y=\"187.0\"></omgdi:waypoint>\r\n        <omgdi:waypoint x=\"260.0\" y=\"187.0\"></omgdi:waypoint>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"flow2\" id=\"BPMNEdge_flow2\">\r\n        <omgdi:waypoint x=\"365.0\" y=\"187.0\"></omgdi:waypoint>\r\n        <omgdi:waypoint x=\"410.0\" y=\"187.0\"></omgdi:waypoint>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"flow3\" id=\"BPMNEdge_flow3\">\r\n        <omgdi:waypoint x=\"430.0\" y=\"167.0\"></omgdi:waypoint>\r\n        <omgdi:waypoint x=\"430.0\" y=\"127.0\"></omgdi:waypoint>\r\n        <omgdi:waypoint x=\"530.0\" y=\"127.0\"></omgdi:waypoint>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"flow4\" id=\"BPMNEdge_flow4\">\r\n        <omgdi:waypoint x=\"430.0\" y=\"207.0\"></omgdi:waypoint>\r\n        <omgdi:waypoint x=\"430.0\" y=\"267.0\"></omgdi:waypoint>\r\n        <omgdi:waypoint x=\"530.0\" y=\"267.0\"></omgdi:waypoint>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"flow5\" id=\"BPMNEdge_flow5\">\r\n        <omgdi:waypoint x=\"635.0\" y=\"127.0\"></omgdi:waypoint>\r\n        <omgdi:waypoint x=\"750.0\" y=\"127.0\"></omgdi:waypoint>\r\n        <omgdi:waypoint x=\"750.0\" y=\"158.0\"></omgdi:waypoint>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"flow6\" id=\"BPMNEdge_flow6\">\r\n        <omgdi:waypoint x=\"635.0\" y=\"267.0\"></omgdi:waypoint>\r\n        <omgdi:waypoint x=\"750.0\" y=\"267.0\"></omgdi:waypoint>\r\n        <omgdi:waypoint x=\"750.0\" y=\"198.0\"></omgdi:waypoint>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"flow7\" id=\"BPMNEdge_flow7\">\r\n        <omgdi:waypoint x=\"770.0\" y=\"178.0\"></omgdi:waypoint>\r\n        <omgdi:waypoint x=\"840.0\" y=\"177.0\"></omgdi:waypoint>\r\n      </bpmndi:BPMNEdge>\r\n    </bpmndi:BPMNPlane>\r\n  </bpmndi:BPMNDiagram>\r\n</definitions>');

-- --------------------------------------------------------

--
-- Table structure for table `process_instance`
--

CREATE TABLE `process_instance` (
  `id` int(11) NOT NULL,
  `satus` varchar(20) NOT NULL,
  `process_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `process_instance`
--

INSERT INTO `process_instance` (`id`, `satus`, `process_id`) VALUES
(1, 'In_Progress', 6),
(2, 'In_Progress', 6),
(3, 'In_Progress', 6),
(4, 'In_Progress', 6),
(5, 'In_Progress', 6),
(6, 'In_Progress', 6),
(7, 'In_Progress', 6),
(8, 'In_Progress', 6),
(9, 'In_Progress', 6),
(10, 'In_Progress', 6),
(11, 'In_Progress', 6),
(12, 'In_Progress', 6),
(13, 'In_Progress', 6),
(14, 'In_Progress', 6),
(15, 'In_Progress', 6),
(16, 'In_Progress', 6),
(17, 'In_Progress', 6),
(18, 'In_Progress', 6),
(19, 'In_Progress', 6);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `active_task`
--
ALTER TABLE `active_task`
  ADD PRIMARY KEY (`id`),
  ADD KEY `instance_id` (`instance_id`);

--
-- Indexes for table `process`
--
ALTER TABLE `process`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `process_instance`
--
ALTER TABLE `process_instance`
  ADD PRIMARY KEY (`id`),
  ADD KEY `process_id` (`process_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `active_task`
--
ALTER TABLE `active_task`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `process`
--
ALTER TABLE `process`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `process_instance`
--
ALTER TABLE `process_instance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `active_task`
--
ALTER TABLE `active_task`
  ADD CONSTRAINT `active_task_ibfk_1` FOREIGN KEY (`instance_id`) REFERENCES `process_instance` (`id`);

--
-- Constraints for table `process_instance`
--
ALTER TABLE `process_instance`
  ADD CONSTRAINT `process_instance_ibfk_1` FOREIGN KEY (`process_id`) REFERENCES `process` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
