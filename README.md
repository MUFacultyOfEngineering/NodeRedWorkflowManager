# NodeRed Workflow Manager

An approach to workflow management system for embedded devices using [Node-RED](http://nodered.org) for implementation, selection, and execution of BPMN files. See architecture and modules in WorkflowManager.pptx

# Requirements
### 1. Node-RED any version
### 2. node-red-dashboard install it under Manage Palette menu
### 3. MySql database

# Installation steps
### 1. Execute the database script located in /BD/process.sql to create tables and constraints for the DB

### 2. Import the Node-RED flows located in /NodeREDFlows

### 3. Upload .bpmn recipes using the endpoint http://localhost:1880/upload_recipe set the actual xml as request body

### 4. Execute a desired process by using the endpoint http://localhost:1880/start_process?processname={YourProcessName}&delayTaskExecution={MilliSecondsOrEmpty}

# Compatibility
### 1. NodeRed Workflow Manager has been tested using recipes created in Camunda and WSO2 Integration Studio 8.0.0. 
### 2. List supported task types: StartEvent, EndEvent, ServiceTask, ParallelGateway, ExclusiveGateway, IntermediateCatchEvent. When the workflow executor tries to execute any other task type, they are just set as finished and the next task is processed.

# BPMN Examples
See /BPMNFlows some of those recipes are written in Camunda and WSO2.

# Under development
The project is still under development at this moment. Many functionalities may be developed for specific use-cases and not fully compatible for all scenarios yet.


# Authoring

Developed at [Mondragon Unibertsitatea](https://www.mondragon.edu/) during the participation of the European project [**Arrowhead Tools**](https://www.arrowhead.eu/arrowheadtools).

Main developers:
- [Alain Perez Riaño](https://www.mondragon.edu/en/bachelor-degree-computer-engineering/lecturers/-/profesor/alain-perez-riano)
- [Felix Larrinaga Barrenechea](https://www.mondragon.edu/en/bachelor-degree-computer-engineering/lecturers/-/profesor/felix-larrinaga-barrenechea)
- William Steven Ochoa Agurto
