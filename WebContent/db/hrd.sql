/*
Navicat PGSQL Data Transfer

Source Server         : org.postgres
Source Server Version : 90309
Source Host           : localhost:5432
Source Database       : hrd
Source Schema         : public

Target Server Type    : PGSQL
Target Server Version : 90309
File Encoding         : 65001

Date: 2015-08-29 11:52:29
*/


-- ----------------------------
-- Sequence structure for seq_class
-- ----------------------------
-- drop SEQUENCE "seq_class";
CREATE SEQUENCE "seq_class"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 1033
 CACHE 1;
SELECT setval('"public"."seq_class"', 1033, true);

-- ----------------------------
-- Sequence structure for seq_classenrol
-- ----------------------------
-- drop SEQUENCE "seq_classenrol";
CREATE SEQUENCE "seq_classenrol"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 1004
 CACHE 1;
SELECT setval('"public"."seq_classenrol"', 1004, true);

-- ----------------------------
-- Sequence structure for seq_course
-- ----------------------------
-- drop SEQUENCE "seq_course";
CREATE SEQUENCE "seq_course"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 1019
 CACHE 1;
SELECT setval('"public"."seq_course"', 1019, true);

-- ----------------------------
-- Sequence structure for seq_generation
-- ----------------------------
-- drop SEQUENCE "seq_generation";
CREATE SEQUENCE "seq_generation"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 1013
 CACHE 1;
SELECT setval('"public"."seq_generation"', 1013, true);

-- ----------------------------
-- Sequence structure for seq_score
-- ----------------------------
-- drop SEQUENCE "seq_score";
CREATE SEQUENCE "seq_score"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 1259
 CACHE 1;
SELECT setval('"public"."seq_score"', 1259, true);

-- ----------------------------
-- Sequence structure for seq_staff
-- ----------------------------
-- drop SEQUENCE "seq_staff";
CREATE SEQUENCE "seq_staff"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 1018
 CACHE 1;
SELECT setval('"public"."seq_staff"', 1018, true);

-- ----------------------------
-- Sequence structure for seq_studentenroll
-- ----------------------------
-- drop SEQUENCE "seq_studentenroll";
CREATE SEQUENCE "seq_studentenroll"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 1000
 CACHE 1;
SELECT setval('"public"."seq_studentenroll"', 1000, true);

-- ----------------------------
-- Sequence structure for seq_sub
-- ----------------------------
-- drop SEQUENCE "seq_sub";
CREATE SEQUENCE "seq_sub"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 1008
 CACHE 1;
SELECT setval('"public"."seq_sub"', 1008, true);

-- ----------------------------
-- Sequence structure for seq_tbattendance
-- ----------------------------
-- drop SEQUENCE "seq_tbattendance";
CREATE SEQUENCE "seq_tbattendance"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 1119
 CACHE 1;
SELECT setval('"public"."seq_tbattendance"', 1119, true);

-- ----------------------------
-- Sequence structure for seq_tbclassenroll
-- ----------------------------
-- drop SEQUENCE "seq_tbclassenroll";
CREATE SEQUENCE "seq_tbclassenroll"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 1070
 CACHE 1;
SELECT setval('"public"."seq_tbclassenroll"', 1070, true);

-- ----------------------------
-- Sequence structure for seq_tbrule
-- ----------------------------
-- drop SEQUENCE "seq_tbrule";
CREATE SEQUENCE "seq_tbrule"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 1027
 CACHE 1;
SELECT setval('"public"."seq_tbrule"', 1027, true);

-- ----------------------------
-- Sequence structure for seq_tbstudent
-- ----------------------------
-- drop SEQUENCE "seq_tbstudent";
CREATE SEQUENCE "seq_tbstudent"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 1193
 CACHE 1;
SELECT setval('"public"."seq_tbstudent"', 1193, true);

-- ----------------------------
-- Sequence structure for seq_tbstudentenroll
-- ----------------------------
-- drop SEQUENCE "seq_tbstudentenroll";
CREATE SEQUENCE "seq_tbstudentenroll"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 1291
 CACHE 1;
SELECT setval('"public"."seq_tbstudentenroll"', 1291, true);

-- ----------------------------
-- Table structure for tbattendance
-- ----------------------------
-- drop TABLE IF EXISTS "tbattendance";
CREATE TABLE "tbattendance" (
"att_id" int4 DEFAULT nextval('seq_tbattendance'::regclass) NOT NULL,
"att_date" date NOT NULL,
"description" text COLLATE "default",
"stu_id" int4 NOT NULL,
"shift" text COLLATE "default" NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of tbattendance
-- ----------------------------
BEGIN;
INSERT INTO "tbattendance" VALUES ('1115', '2015-08-25', 'Permission', '1018', 'am');
INSERT INTO "tbattendance" VALUES ('1116', '2015-08-24', 'No Permission', '1018', 'am');
INSERT INTO "tbattendance" VALUES ('1117', '2015-08-23', 'Late', '1018', 'am');
INSERT INTO "tbattendance" VALUES ('1118', '2015-08-26', 'No Permission', '1023', 'am');
INSERT INTO "tbattendance" VALUES ('1119', '2015-08-16', 'Permission', '1018', 'am');
COMMIT;

-- ----------------------------
-- Table structure for tbclass
-- ----------------------------
-- drop TABLE IF EXISTS "tbclass";
CREATE TABLE "tbclass" (
"class_id" int4 DEFAULT nextval('seq_class'::regclass) NOT NULL,
"class_name" text COLLATE "default" NOT NULL,
"cou_id" int4 NOT NULL,
"active" bool DEFAULT true
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of tbclass
-- ----------------------------
BEGIN;
INSERT INTO "tbclass" VALUES ('1025', 'Battambang', '1014', 'f');
INSERT INTO "tbclass" VALUES ('1026', 'Phnom Penh', '1014', 'f');
INSERT INTO "tbclass" VALUES ('1027', 'Siem Reap', '1014', 'f');
INSERT INTO "tbclass" VALUES ('1028', 'Phnom Penh', '1019', 'f');
INSERT INTO "tbclass" VALUES ('1029', 'Battambang', '1019', 'f');
INSERT INTO "tbclass" VALUES ('1030', 'Siem Reap', '1017', 't');
INSERT INTO "tbclass" VALUES ('1031', 'Phnom Penh', '1017', 't');
INSERT INTO "tbclass" VALUES ('1032', 'Battambang', '1017', 't');
INSERT INTO "tbclass" VALUES ('1033', 'Kampong Saom', '1017', 't');
COMMIT;

-- ----------------------------
-- Table structure for tbclassenroll
-- ----------------------------
-- drop TABLE IF EXISTS "tbclassenroll";
CREATE TABLE "tbclassenroll" (
"staff_id" int4 NOT NULL,
"sub_id" int4 NOT NULL,
"class_id" int4 NOT NULL,
"class_enroll" int4 DEFAULT nextval('seq_tbclassenroll'::regclass) NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of tbclassenroll
-- ----------------------------
BEGIN;
INSERT INTO "tbclassenroll" VALUES ('1012', '1004', '1029', '1060');
INSERT INTO "tbclassenroll" VALUES ('1013', '1005', '1029', '1061');
INSERT INTO "tbclassenroll" VALUES ('1016', '1004', '1028', '1062');
INSERT INTO "tbclassenroll" VALUES ('1013', '1005', '1028', '1063');
INSERT INTO "tbclassenroll" VALUES ('1014', '1006', '1029', '1064');
INSERT INTO "tbclassenroll" VALUES ('1015', '1006', '1029', '1065');
INSERT INTO "tbclassenroll" VALUES ('1014', '1006', '1028', '1066');
INSERT INTO "tbclassenroll" VALUES ('1015', '1006', '1028', '1067');
INSERT INTO "tbclassenroll" VALUES ('1012', '1004', '1025', '1068');
INSERT INTO "tbclassenroll" VALUES ('1013', '1005', '1025', '1069');
INSERT INTO "tbclassenroll" VALUES ('1014', '1006', '1025', '1070');
COMMIT;

-- ----------------------------
-- Table structure for tbcourse
-- ----------------------------
-- drop TABLE IF EXISTS "tbcourse";
CREATE TABLE "tbcourse" (
"cou_id" int4 DEFAULT nextval('seq_course'::regclass) NOT NULL,
"cou_name" text COLLATE "default" NOT NULL,
"start_date" date,
"end_date" date,
"gen_id" int4 NOT NULL,
"is_finish" bool DEFAULT false
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of tbcourse
-- ----------------------------
BEGIN;
INSERT INTO "tbcourse" VALUES ('1014', 'Basic', '2015-02-01', '2015-08-31', '1012', 'f');
INSERT INTO "tbcourse" VALUES ('1015', 'Basic', '2015-08-04', '2015-08-19', '1010', 't');
INSERT INTO "tbcourse" VALUES ('1016', 'Advanced', '2015-08-10', '2015-08-16', '1010', 't');
INSERT INTO "tbcourse" VALUES ('1017', 'Basic', '2015-08-11', '2015-08-10', '1011', 't');
INSERT INTO "tbcourse" VALUES ('1018', 'Advanced', '2015-07-26', '2015-09-05', '1011', 't');
INSERT INTO "tbcourse" VALUES ('1019', 'Advanced', '2015-08-02', '2015-08-04', '1012', 't');
COMMIT;

-- ----------------------------
-- Table structure for tbgeneration
-- ----------------------------
-- drop TABLE IF EXISTS "tbgeneration";
CREATE TABLE "tbgeneration" (
"gen_id" int4 DEFAULT nextval('seq_generation'::regclass) NOT NULL,
"gen_name" text COLLATE "default",
"start_date" date,
"end_date" date,
"is_finish" bool DEFAULT false
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of tbgeneration
-- ----------------------------
BEGIN;
INSERT INTO "tbgeneration" VALUES ('1010', '1st Generation', '2015-08-03', '2015-08-05', 't');
INSERT INTO "tbgeneration" VALUES ('1011', '2nd Generation', '2015-08-09', '2015-08-17', 't');
INSERT INTO "tbgeneration" VALUES ('1012', '3rd Generation', '2015-08-04', '2015-08-03', 'f');
COMMIT;

-- ----------------------------
-- Table structure for tbrule
-- ----------------------------
-- drop TABLE IF EXISTS "tbrule";
CREATE TABLE "tbrule" (
"grade" text COLLATE "default" NOT NULL,
"rank_lower" int4,
"cou_id" int4 NOT NULL,
"rank_top" int4,
"detail_grade" text COLLATE "default",
"rule_id" int4 DEFAULT nextval('seq_tbrule'::regclass) NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of tbrule
-- ----------------------------
BEGIN;
INSERT INTO "tbrule" VALUES ('A', '90', '1014', '100', 'Excellence', '1015');
INSERT INTO "tbrule" VALUES ('B', '80', '1014', '89', 'Very Good', '1016');
INSERT INTO "tbrule" VALUES ('C', '70', '1014', '79', 'Good', '1017');
INSERT INTO "tbrule" VALUES ('D', '60', '1014', '69', 'Fair', '1018');
INSERT INTO "tbrule" VALUES ('E', '50', '1014', '59', 'Pass', '1019');
INSERT INTO "tbrule" VALUES ('A', '90', '1019', '100', 'Excellence', '1022');
INSERT INTO "tbrule" VALUES ('B', '80', '1019', '89', 'Very Good', '1023');
INSERT INTO "tbrule" VALUES ('C', '70', '1019', '79', 'Good', '1024');
INSERT INTO "tbrule" VALUES ('D', '60', '1019', '69', 'Fair', '1025');
INSERT INTO "tbrule" VALUES ('E', '50', '1019', '59', 'Pass', '1026');
INSERT INTO "tbrule" VALUES ('F', '0', '1019', '49', 'Fail', '1027');
COMMIT;

-- ----------------------------
-- Table structure for tbscore
-- ----------------------------
-- drop TABLE IF EXISTS "tbscore";
CREATE TABLE "tbscore" (
"score_id" int4 DEFAULT nextval('seq_score'::regclass) NOT NULL,
"score" numeric(5,2),
"score_date" date,
"stu_id" int4,
"sub_id" int4
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of tbscore
-- ----------------------------
BEGIN;
INSERT INTO "tbscore" VALUES ('1176', '90.00', '2015-08-02', '1023', '1004');
INSERT INTO "tbscore" VALUES ('1177', '89.00', '2015-08-02', '1022', '1004');
INSERT INTO "tbscore" VALUES ('1178', '89.00', '2015-08-02', '1024', '1004');
INSERT INTO "tbscore" VALUES ('1179', '89.00', '2015-08-02', '1026', '1004');
INSERT INTO "tbscore" VALUES ('1180', '98.00', '2015-08-02', '1027', '1004');
INSERT INTO "tbscore" VALUES ('1181', '77.00', '2015-08-02', '1028', '1004');
INSERT INTO "tbscore" VALUES ('1182', '78.00', '2015-08-02', '1029', '1004');
INSERT INTO "tbscore" VALUES ('1183', '45.00', '2015-08-02', '1030', '1004');
INSERT INTO "tbscore" VALUES ('1184', '78.00', '2015-08-02', '1031', '1004');
INSERT INTO "tbscore" VALUES ('1185', '78.00', '2015-08-02', '1032', '1004');
INSERT INTO "tbscore" VALUES ('1186', '67.00', '2015-08-02', '1033', '1004');
INSERT INTO "tbscore" VALUES ('1187', '87.00', '2015-08-02', '1034', '1004');
INSERT INTO "tbscore" VALUES ('1188', '78.00', '2015-08-02', '1035', '1004');
INSERT INTO "tbscore" VALUES ('1189', '97.00', '2015-08-02', '1018', '1004');
INSERT INTO "tbscore" VALUES ('1190', '90.00', '2015-08-02', '1019', '1004');
INSERT INTO "tbscore" VALUES ('1191', '89.00', '2015-08-02', '1020', '1004');
INSERT INTO "tbscore" VALUES ('1192', '89.00', '2015-08-02', '1036', '1004');
INSERT INTO "tbscore" VALUES ('1193', '89.00', '2015-08-02', '1037', '1004');
INSERT INTO "tbscore" VALUES ('1194', '89.00', '2015-08-02', '1038', '1004');
INSERT INTO "tbscore" VALUES ('1195', '89.00', '2015-08-02', '1039', '1004');
INSERT INTO "tbscore" VALUES ('1196', '89.00', '2015-08-02', '1040', '1004');
INSERT INTO "tbscore" VALUES ('1197', '89.00', '2015-08-02', '1041', '1004');
INSERT INTO "tbscore" VALUES ('1198', '89.00', '2015-08-02', '1042', '1004');
INSERT INTO "tbscore" VALUES ('1199', '34.00', '2015-08-02', '1043', '1004');
INSERT INTO "tbscore" VALUES ('1200', '89.00', '2015-08-02', '1044', '1004');
INSERT INTO "tbscore" VALUES ('1201', '89.00', '2015-08-02', '1045', '1004');
INSERT INTO "tbscore" VALUES ('1202', '90.00', '2015-08-02', '1046', '1004');
INSERT INTO "tbscore" VALUES ('1203', '90.00', '2015-08-02', '1047', '1004');
INSERT INTO "tbscore" VALUES ('1204', '90.00', '2015-08-02', '1023', '1006');
INSERT INTO "tbscore" VALUES ('1205', '90.00', '2015-08-02', '1022', '1006');
INSERT INTO "tbscore" VALUES ('1206', '90.00', '2015-08-02', '1024', '1006');
INSERT INTO "tbscore" VALUES ('1207', '90.00', '2015-08-02', '1026', '1006');
INSERT INTO "tbscore" VALUES ('1208', '90.00', '2015-08-02', '1027', '1006');
INSERT INTO "tbscore" VALUES ('1209', '90.00', '2015-08-02', '1028', '1006');
INSERT INTO "tbscore" VALUES ('1210', '90.00', '2015-08-02', '1029', '1006');
INSERT INTO "tbscore" VALUES ('1211', '90.00', '2015-08-02', '1030', '1006');
INSERT INTO "tbscore" VALUES ('1212', '90.00', '2015-08-02', '1031', '1006');
INSERT INTO "tbscore" VALUES ('1213', '90.00', '2015-08-02', '1032', '1006');
INSERT INTO "tbscore" VALUES ('1214', '90.00', '2015-08-02', '1033', '1006');
INSERT INTO "tbscore" VALUES ('1215', '90.00', '2015-08-02', '1034', '1006');
INSERT INTO "tbscore" VALUES ('1216', '90.00', '2015-08-02', '1035', '1006');
INSERT INTO "tbscore" VALUES ('1217', '90.00', '2015-08-02', '1018', '1006');
INSERT INTO "tbscore" VALUES ('1218', '90.00', '2015-08-02', '1019', '1006');
INSERT INTO "tbscore" VALUES ('1219', '90.00', '2015-08-02', '1020', '1006');
INSERT INTO "tbscore" VALUES ('1220', '90.00', '2015-08-02', '1036', '1006');
INSERT INTO "tbscore" VALUES ('1221', '90.00', '2015-08-02', '1037', '1006');
INSERT INTO "tbscore" VALUES ('1222', '90.00', '2015-08-02', '1038', '1006');
INSERT INTO "tbscore" VALUES ('1223', '90.00', '2015-08-02', '1039', '1006');
INSERT INTO "tbscore" VALUES ('1224', '90.00', '2015-08-02', '1040', '1006');
INSERT INTO "tbscore" VALUES ('1225', '90.00', '2015-08-02', '1041', '1006');
INSERT INTO "tbscore" VALUES ('1226', '90.00', '2015-08-02', '1042', '1006');
INSERT INTO "tbscore" VALUES ('1227', '90.00', '2015-08-02', '1043', '1006');
INSERT INTO "tbscore" VALUES ('1228', '90.00', '2015-08-02', '1044', '1006');
INSERT INTO "tbscore" VALUES ('1229', '90.00', '2015-08-02', '1045', '1006');
INSERT INTO "tbscore" VALUES ('1230', '90.00', '2015-08-02', '1046', '1006');
INSERT INTO "tbscore" VALUES ('1231', '90.00', '2015-08-02', '1047', '1006');
INSERT INTO "tbscore" VALUES ('1232', '80.00', '2015-08-02', '1023', '1005');
INSERT INTO "tbscore" VALUES ('1233', '90.00', '2015-08-02', '1022', '1005');
INSERT INTO "tbscore" VALUES ('1234', '90.00', '2015-08-02', '1024', '1005');
INSERT INTO "tbscore" VALUES ('1235', '90.00', '2015-08-02', '1026', '1005');
INSERT INTO "tbscore" VALUES ('1236', '90.00', '2015-08-02', '1027', '1005');
INSERT INTO "tbscore" VALUES ('1237', '90.00', '2015-08-02', '1028', '1005');
INSERT INTO "tbscore" VALUES ('1238', '90.00', '2015-08-02', '1029', '1005');
INSERT INTO "tbscore" VALUES ('1239', '90.00', '2015-08-02', '1030', '1005');
INSERT INTO "tbscore" VALUES ('1240', '90.00', '2015-08-02', '1031', '1005');
INSERT INTO "tbscore" VALUES ('1241', '65.00', '2015-08-02', '1032', '1005');
INSERT INTO "tbscore" VALUES ('1242', '65.00', '2015-08-02', '1033', '1005');
INSERT INTO "tbscore" VALUES ('1243', '85.00', '2015-08-02', '1034', '1005');
INSERT INTO "tbscore" VALUES ('1244', '80.00', '2015-08-02', '1035', '1005');
INSERT INTO "tbscore" VALUES ('1245', '98.00', '2015-08-02', '1018', '1005');
INSERT INTO "tbscore" VALUES ('1246', '76.00', '2015-08-02', '1019', '1005');
INSERT INTO "tbscore" VALUES ('1247', '76.00', '2015-08-02', '1020', '1005');
INSERT INTO "tbscore" VALUES ('1248', '86.00', '2015-08-02', '1036', '1005');
INSERT INTO "tbscore" VALUES ('1249', '80.00', '2015-08-02', '1037', '1005');
INSERT INTO "tbscore" VALUES ('1250', '68.00', '2015-08-02', '1038', '1005');
INSERT INTO "tbscore" VALUES ('1251', '80.00', '2015-08-02', '1039', '1005');
INSERT INTO "tbscore" VALUES ('1252', '76.00', '2015-08-02', '1040', '1005');
INSERT INTO "tbscore" VALUES ('1253', '90.00', '2015-08-02', '1041', '1005');
INSERT INTO "tbscore" VALUES ('1254', '89.00', '2015-08-02', '1042', '1005');
INSERT INTO "tbscore" VALUES ('1255', '89.00', '2015-08-02', '1043', '1005');
INSERT INTO "tbscore" VALUES ('1256', '89.00', '2015-08-02', '1044', '1005');
INSERT INTO "tbscore" VALUES ('1257', '89.00', '2015-08-02', '1045', '1005');
INSERT INTO "tbscore" VALUES ('1258', '80.00', '2015-08-02', '1046', '1005');
INSERT INTO "tbscore" VALUES ('1259', '80.00', '2015-08-02', '1047', '1005');
COMMIT;

-- ----------------------------
-- Table structure for tbstaff
-- ----------------------------
-- drop TABLE IF EXISTS "tbstaff";
CREATE TABLE "tbstaff" (
"staff_id" int4 DEFAULT nextval('seq_staff'::regclass) NOT NULL,
"first_name" text COLLATE "default",
"last_name" text COLLATE "default",
"gender" char(1) COLLATE "default",
"position" text COLLATE "default",
"phone" text COLLATE "default",
"email" text COLLATE "default",
"pasword" text COLLATE "default",
"photo" text COLLATE "default",
"status" text COLLATE "default" DEFAULT 'available'::text
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of tbstaff
-- ----------------------------
BEGIN;
INSERT INTO "tbstaff" VALUES ('1008', 'Heak', 'Menghok', 'M', 'Admin', '(012) 777-777_', 'menghokheak@gmail.com', '875afc94bc041e7096b9ece017c5dff66867e463f8b1af4530289227fc1ab920071a8970a066887c33c095c1513666e9764fd5ebb62df28aa6674d87c80842f0', '1008.jpg', 'available');
INSERT INTO "tbstaff" VALUES ('1012', 'Ly', 'Pichponreay', 'M', 'Instructor', '(098) 343-4333', 'pichponreayly@gmail.com', '875afc94bc041e7096b9ece017c5dff66867e463f8b1af4530289227fc1ab920071a8970a066887c33c095c1513666e9764fd5ebb62df28aa6674d87c80842f0', '1012.jpg', 'available');
INSERT INTO "tbstaff" VALUES ('1013', 'Sak', 'Sonita', 'F', 'Instructor', '(098) 343-434_', 'saksonita@gmail.com', '875afc94bc041e7096b9ece017c5dff66867e463f8b1af4530289227fc1ab920071a8970a066887c33c095c1513666e9764fd5ebb62df28aa6674d87c80842f0', '1013.jpg', 'available');
INSERT INTO "tbstaff" VALUES ('1014', 'Huon', 'Sorphea', 'F', 'Instructor', '(010) 999-888_', 'sorpheahuon@gmail.com', '875afc94bc041e7096b9ece017c5dff66867e463f8b1af4530289227fc1ab920071a8970a066887c33c095c1513666e9764fd5ebb62df28aa6674d87c80842f0', '1014.jpg', 'available');
INSERT INTO "tbstaff" VALUES ('1015', 'Nik', 'Boram', 'F', 'Instructor', '(010) 222-999_', 'nik@gmail.com', '875afc94bc041e7096b9ece017c5dff66867e463f8b1af4530289227fc1ab920071a8970a066887c33c095c1513666e9764fd5ebb62df28aa6674d87c80842f0', '1015.jpg', 'available');
INSERT INTO "tbstaff" VALUES ('1016', 'Doung', 'Chan Khihort', 'M', 'Instructor', '(010) 222-333_', 'khihort@gmail.com', '875afc94bc041e7096b9ece017c5dff66867e463f8b1af4530289227fc1ab920071a8970a066887c33c095c1513666e9764fd5ebb62df28aa6674d87c80842f0', '1016.jpg', 'available');
INSERT INTO "tbstaff" VALUES ('1017', 'Chheang', 'Vuthea', 'M', 'Instructor', '(096) 777-8888', 'vuthea@gmail.com', '875afc94bc041e7096b9ece017c5dff66867e463f8b1af4530289227fc1ab920071a8970a066887c33c095c1513666e9764fd5ebb62df28aa6674d87c80842f0', '1017.jpg', 'available');
INSERT INTO "tbstaff" VALUES ('1018', 'Leang', 'Bunrong', 'M', 'Instructor', '(098) 777-333_', 'bunrong@gmail.com', '875afc94bc041e7096b9ece017c5dff66867e463f8b1af4530289227fc1ab920071a8970a066887c33c095c1513666e9764fd5ebb62df28aa6674d87c80842f0', '1018.jpg', 'available');
COMMIT;

-- ----------------------------
-- Table structure for tbstudent
-- ----------------------------
-- drop TABLE IF EXISTS "tbstudent";
CREATE TABLE "tbstudent" (
"stu_id" int4 DEFAULT nextval('seq_tbstudent'::regclass) NOT NULL,
"first_name" text COLLATE "default",
"last_name" text COLLATE "default",
"gender" char(1) COLLATE "default",
"dob" date,
"email" text COLLATE "default",
"password" text COLLATE "default",
"address" text COLLATE "default",
"phone" text COLLATE "default",
"race" text COLLATE "default",
"social_id" text COLLATE "default",
"photo" text COLLATE "default",
"father_name" text COLLATE "default",
"father_phone" text COLLATE "default",
"mother_name" text COLLATE "default",
"mother_phone" text COLLATE "default",
"status" text COLLATE "default" DEFAULT 'active'::text
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of tbstudent
-- ----------------------------
BEGIN;
INSERT INTO "tbstudent" VALUES ('1018', 'Lun', 'Sovathana', 'M', '2015-08-12', 'sovathanalun@gmail.com', '875afc94bc041e7096b9ece017c5dff66867e463f8b1af4530289227fc1ab920071a8970a066887c33c095c1513666e9764fd5ebb62df28aa6674d87c80842f0', 'Phnom Penh', '(070) 565-585_', 'Khmer', '1234567890', '1018.jpg', 'Father', '(097) 876-5432', 'Mother', '(097) 887-7734', 'unavailable');
INSERT INTO "tbstudent" VALUES ('1019', 'Sok', 'Lundy', 'M', '2015-08-10', 'soklundy@gmail.com', '875afc94bc041e7096b9ece017c5dff66867e463f8b1af4530289227fc1ab920071a8970a066887c33c095c1513666e9764fd5ebb62df28aa6674d87c80842f0', 'Phnom Penh', '(069) 696-469_', 'Khmer', '0987654321', '1019.jpg', 'Father', '(098) 773-322_', 'Mother', '(098) 777-788_', 'unavailable');
INSERT INTO "tbstudent" VALUES ('1020', 'Mom', 'Kunthy', 'F', '1993-09-13', 'kunthymom@gmail.com', '875afc94bc041e7096b9ece017c5dff66867e463f8b1af4530289227fc1ab920071a8970a066887c33c095c1513666e9764fd5ebb62df28aa6674d87c80842f0', 'Kandal', '(096) 812-6696', 'Khmer', '03434334343', '1020.jpg', 'Papa', '(012) 999-222_', 'Mama', '(077) 777-888_', 'unavailable');
INSERT INTO "tbstudent" VALUES ('1021', 'Khut', 'Bunthorn', 'M', '1993-09-07', 'khutbunthorn@gmail.com', '875afc94bc041e7096b9ece017c5dff66867e463f8b1af4530289227fc1ab920071a8970a066887c33c095c1513666e9764fd5ebb62df28aa6674d87c80842f0', 'Kandal', '(098) 777-323_', 'Khmer', '0192837365', 'default-profile.png', 'Father', '(098) 343-434_', 'Mother', '(098) 343-434_', '-- drop');
INSERT INTO "tbstudent" VALUES ('1022', 'Sa', 'Sokngim', 'F', '1993-09-15', 'sokngimsa@gmail.com', '875afc94bc041e7096b9ece017c5dff66867e463f8b1af4530289227fc1ab920071a8970a066887c33c095c1513666e9764fd5ebb62df28aa6674d87c80842f0', 'Phnom Penh', '(012) 333-111_', 'Khmer', '0123456789', '1022.jpg', 'Father', '(078) 222-888_', 'Mother', '(089) 777-888_', 'unavailable');
INSERT INTO "tbstudent" VALUES ('1023', 'Ly', 'Vandan', 'M', '1993-09-07', 'lyvandan@gmail.com', '875afc94bc041e7096b9ece017c5dff66867e463f8b1af4530289227fc1ab920071a8970a066887c33c095c1513666e9764fd5ebb62df28aa6674d87c80842f0', 'Phnom Penh', '(098) 232-323_', 'Khmer', '232374937430', '1023.jpg', 'Father', '(098) 334-323_', 'Mother', '(067) 232-322_', 'unavailable');
INSERT INTO "tbstudent" VALUES ('1024', 'Thorn', 'Sereyvong', 'M', '2015-08-03', 'thornsereyvong@gmail.com', '875afc94bc041e7096b9ece017c5dff66867e463f8b1af4530289227fc1ab920071a8970a066887c33c095c1513666e9764fd5ebb62df28aa6674d87c80842f0', 'Phnom Penh', '(098) 111-111_', 'Khmer', '233947937439', '1024.jpg', 'Father', '(098) 777-7777', 'Mother', '(012) 444-443_', 'unavailable');
INSERT INTO "tbstudent" VALUES ('1026', 'Aing', 'Teckchun', 'M', '2015-08-02', 'teckchunaing@gmail.com', '875afc94bc041e7096b9ece017c5dff66867e463f8b1af4530289227fc1ab920071a8970a066887c33c095c1513666e9764fd5ebb62df28aa6674d87c80842f0', 'Phnom Penh', '(010) 123-456_', 'Khmer', '304930493430', 'default-profile.png', '', '', '', '', 'unavailable');
INSERT INTO "tbstudent" VALUES ('1027', 'Chan', 'Dana', 'F', '2015-08-03', 'chandana@gmail.com', '875afc94bc041e7096b9ece017c5dff66867e463f8b1af4530289227fc1ab920071a8970a066887c33c095c1513666e9764fd5ebb62df28aa6674d87c80842f0', 'Phnom Penh', '(098) 334-3323', 'Khmer', '0203923992', 'default-profile.png', '', '', '', '', 'unavailable');
INSERT INTO "tbstudent" VALUES ('1028', 'Yin', 'Kokpheng', 'M', '2015-08-19', 'kokphengyin@gmail.com', '875afc94bc041e7096b9ece017c5dff66867e463f8b1af4530289227fc1ab920071a8970a066887c33c095c1513666e9764fd5ebb62df28aa6674d87c80842f0', 'Phnom Penh', '(010) 839-775_', 'Khmer', '023020302', 'default-profile.png', '', '', '', '', 'unavailable');
INSERT INTO "tbstudent" VALUES ('1029', 'Ok', 'Reksmey', 'M', '2015-08-10', 'okreksmey@gmial.com', '875afc94bc041e7096b9ece017c5dff66867e463f8b1af4530289227fc1ab920071a8970a066887c33c095c1513666e9764fd5ebb62df28aa6674d87c80842f0', 'Phnom Penh', '(012) 450-560_', 'Khmer', '0293928392', 'default-profile.png', '', '', '', '', 'unavailable');
INSERT INTO "tbstudent" VALUES ('1030', 'Sophath', 'Chan', 'M', '0092-09-25', 'sophath_chan@graduate.org', 'fa585d89c851dd338a70dcf535aa2a92fee7836dd6aff1226583e88e0996293f16bc009c652826e0fc5c706695a03cddce372f139eff4d13959da6f1f5d3eabe', 'Kompong Chhnang', '(096) 626-0360', 'cambodia', '40311146', 'default-profile.png', '', '', '', '', 'unavailable');
INSERT INTO "tbstudent" VALUES ('1031', ' Vichet', 'Chann', 'M', '0093-05-25', 'vichet297@gmail.com', 'fa585d89c851dd338a70dcf535aa2a92fee7836dd6aff1226583e88e0996293f16bc009c652826e0fc5c706695a03cddce372f139eff4d13959da6f1f5d3eabe', 'Svay Rieng', '(099) 506-066_', 'cambodia', '090411030', 'default-profile.png', '', '', '', '', 'unavailable');
INSERT INTO "tbstudent" VALUES ('1032', 'Elit', 'Chhorn', 'M', '0094-02-25', 'chhornelit@gmail.com', 'fa585d89c851dd338a70dcf535aa2a92fee7836dd6aff1226583e88e0996293f16bc009c652826e0fc5c706695a03cddce372f139eff4d13959da6f1f5d3eabe', 'PP', '(086) 823-938_', 'cambodia', '10793747', 'default-profile.png', '', '', '', '', 'unavailable');
INSERT INTO "tbstudent" VALUES ('1033', 'Sarin', 'Hem', 'M', '0093-11-25', 'hemsarin.rupp@gmail.com', 'fa585d89c851dd338a70dcf535aa2a92fee7836dd6aff1226583e88e0996293f16bc009c652826e0fc5c706695a03cddce372f139eff4d13959da6f1f5d3eabe', 'kandal', '(096) 505-7126', 'cambodia', '20905077', 'default-profile.png', '', '', '', '', 'unavailable');
INSERT INTO "tbstudent" VALUES ('1034', 'Pisal', 'Ke', 'M', '0089-04-25', 'kepisal@gmail.com', 'fa585d89c851dd338a70dcf535aa2a92fee7836dd6aff1226583e88e0996293f16bc009c652826e0fc5c706695a03cddce372f139eff4d13959da6f1f5d3eabe', 'PP', '(017) 868-908_', 'cambodia', '10679350', 'default-profile.png', '', '', '', '', 'unavailable');
INSERT INTO "tbstudent" VALUES ('1035', 'Bunthorn', 'Khut', 'M', '0092-03-25', 'khut_bunthorn@yahoo.com', 'fa585d89c851dd338a70dcf535aa2a92fee7836dd6aff1226583e88e0996293f16bc009c652826e0fc5c706695a03cddce372f139eff4d13959da6f1f5d3eabe', 'Takeo', '(010) 999-088_', 'cambodia', '100849340', 'default-profile.png', '', '', '', '', 'unavailable');
INSERT INTO "tbstudent" VALUES ('1036', 'Sovathana', 'Lun', 'M', '1995-01-18', 'sovathanalun@gmail.com', 'fa585d89c851dd338a70dcf535aa2a92fee7836dd6aff1226583e88e0996293f16bc009c652826e0fc5c706695a03cddce372f139eff4d13959da6f1f5d3eabe', 'PP', '(070) 565-585_', 'cambodia', '10802217', 'default-profile.png', '', '', '', '', 'unavailable');
INSERT INTO "tbstudent" VALUES ('1037', 'Vandan', 'Ly', 'M', '1992-06-13', 'davira40@yahoo.com', 'fa585d89c851dd338a70dcf535aa2a92fee7836dd6aff1226583e88e0996293f16bc009c652826e0fc5c706695a03cddce372f139eff4d13959da6f1f5d3eabe', 'Prey Veng', '(093) 266-098_', 'cambodia', '50712426', 'default-profile.png', '', '', '', '', 'unavailable');
INSERT INTO "tbstudent" VALUES ('1038', 'Kunthy', 'Mom', 'F', '1993-10-09', 'kunthymom@gmail.com', 'fa585d89c851dd338a70dcf535aa2a92fee7836dd6aff1226583e88e0996293f16bc009c652826e0fc5c706695a03cddce372f139eff4d13959da6f1f5d3eabe', 'kandal', '(096) 812-6696', 'cambodia', '20788513', 'default-profile.png', '', '', '', '', 'unavailable');
INSERT INTO "tbstudent" VALUES ('1039', ' Narith', 'Nao', 'M', '1994-09-17', 'narithnao@gmail.com', 'fa585d89c851dd338a70dcf535aa2a92fee7836dd6aff1226583e88e0996293f16bc009c652826e0fc5c706695a03cddce372f139eff4d13959da6f1f5d3eabe', 'Prey Veng', '(012) 460-580_', 'cambodia', '50743594', 'default-profile.png', '', '', '', '', 'unavailable');
INSERT INTO "tbstudent" VALUES ('1040', 'Chanthorn', 'Prem', 'M', '1992-01-15', 'premchanthorn007@gmail.com', 'fa585d89c851dd338a70dcf535aa2a92fee7836dd6aff1226583e88e0996293f16bc009c652826e0fc5c706695a03cddce372f139eff4d13959da6f1f5d3eabe', 'BMC', '(070) 989-007_', 'cambodia', '190625133', 'default-profile.png', '', '', '', '', 'unavailable');
INSERT INTO "tbstudent" VALUES ('1041', 'Channa', 'Rours', 'M', '1994-05-06', 'rourschanna@gmail.com', 'fa585d89c851dd338a70dcf535aa2a92fee7836dd6aff1226583e88e0996293f16bc009c652826e0fc5c706695a03cddce372f139eff4d13959da6f1f5d3eabe', 'Kampong Chhnang', '(096) 789-0007', 'cambodia', '40318135', 'default-profile.png', '', '', '', '', 'unavailable');
INSERT INTO "tbstudent" VALUES ('1042', 'Sokngim', 'Sa', 'F', '1992-01-01', 'sokngimsa@gmail.com', 'fa585d89c851dd338a70dcf535aa2a92fee7836dd6aff1226583e88e0996293f16bc009c652826e0fc5c706695a03cddce372f139eff4d13959da6f1f5d3eabe', 'PP', '(086) 862-266_', 'cambodia', '10718840', 'default-profile.png', '', '', '', '', 'unavailable');
INSERT INTO "tbstudent" VALUES ('1043', 'Sambo', 'Siang', 'M', '1992-11-27', 'siang.sambo@gmail.com', 'fa585d89c851dd338a70dcf535aa2a92fee7836dd6aff1226583e88e0996293f16bc009c652826e0fc5c706695a03cddce372f139eff4d13959da6f1f5d3eabe', 'Pursat', '(069) 383-840_', 'cambodia', '160294552', 'default-profile.png', '', '', '', '', 'unavailable');
INSERT INTO "tbstudent" VALUES ('1044', ' Lundy', 'Sok', 'M', '1994-06-20', 'bonglundy208@gmail.com', 'fa585d89c851dd338a70dcf535aa2a92fee7836dd6aff1226583e88e0996293f16bc009c652826e0fc5c706695a03cddce372f139eff4d13959da6f1f5d3eabe', 'PP', '(069) 696-469_', 'cambodia', '', 'default-profile.png', '', '', '', '', 'unavailable');
INSERT INTO "tbstudent" VALUES ('1045', 'Leang Heng', 'Sry', 'M', '1992-06-06', 'sry_leang_heng@outlook.com', 'fa585d89c851dd338a70dcf535aa2a92fee7836dd6aff1226583e88e0996293f16bc009c652826e0fc5c706695a03cddce372f139eff4d13959da6f1f5d3eabe', 'Prey Veng', '(077) 671-813_', 'cambodia', '10674182', 'default-profile.png', '', '', '', '', 'unavailable');
INSERT INTO "tbstudent" VALUES ('1046', 'Vicheychetra', 'Sun', 'M', '1992-11-07', 'suntravi@gmail.com', 'fa585d89c851dd338a70dcf535aa2a92fee7836dd6aff1226583e88e0996293f16bc009c652826e0fc5c706695a03cddce372f139eff4d13959da6f1f5d3eabe', 'Takeo', '(081) 401-600_', 'cambodia', '100656672', 'default-profile.png', '', '', '', '', 'unavailable');
INSERT INTO "tbstudent" VALUES ('1047', 'Sereyvong', 'Thorn', 'M', '1993-02-15', 'sereyvong98@gmail.com', 'fa585d89c851dd338a70dcf535aa2a92fee7836dd6aff1226583e88e0996293f16bc009c652826e0fc5c706695a03cddce372f139eff4d13959da6f1f5d3eabe', 'PP', '(098) 333-208_', 'cambodia', '10813884', 'default-profile.png', '', '', '', '', 'unavailable');
INSERT INTO "tbstudent" VALUES ('1048', 'Teckchun', 'Aing', 'M', '1994-02-09', 'teckchunaing@gmail.com', 'fa585d89c851dd338a70dcf535aa2a92fee7836dd6aff1226583e88e0996293f16bc009c652826e0fc5c706695a03cddce372f139eff4d13959da6f1f5d3eabe', 'PP', '(010) 738-319_', 'cambodia', '10752455', 'default-profile.png', '', '', '', '', 'unavailable');
INSERT INTO "tbstudent" VALUES ('1049', 'Dana', 'Chan', 'F', '1992-02-02', 'danachan235@gmail.com', 'fa585d89c851dd338a70dcf535aa2a92fee7836dd6aff1226583e88e0996293f16bc009c652826e0fc5c706695a03cddce372f139eff4d13959da6f1f5d3eabe', 'Kandal', '(093) 343-436_', 'cambodia', '10706424', 'default-profile.png', '', '', '', '', 'unavailable');
INSERT INTO "tbstudent" VALUES ('1050', 'Ratha', 'Chum', 'M', '1991-11-11', 'chumratha.corel@gmail.com', 'fa585d89c851dd338a70dcf535aa2a92fee7836dd6aff1226583e88e0996293f16bc009c652826e0fc5c706695a03cddce372f139eff4d13959da6f1f5d3eabe', 'BMC', '(092) 929-976_', 'cambodia', '10752455', 'default-profile.png', '', '', '', '', 'unavailable');
INSERT INTO "tbstudent" VALUES ('1051', 'Lynda', 'Chun', 'F', '1995-04-19', 'chunlynda1@gmail.com', 'fa585d89c851dd338a70dcf535aa2a92fee7836dd6aff1226583e88e0996293f16bc009c652826e0fc5c706695a03cddce372f139eff4d13959da6f1f5d3eabe', 'Kompong Cham', '(093) 678-037_', 'cambodia', '61378255', 'default-profile.png', '', '', '', '', 'unavailable');
INSERT INTO "tbstudent" VALUES ('1052', 'Bunthoeurn', 'Khoem', 'M', '1992-12-09', 'th_kbt@yahoo.com', 'fa585d89c851dd338a70dcf535aa2a92fee7836dd6aff1226583e88e0996293f16bc009c652826e0fc5c706695a03cddce372f139eff4d13959da6f1f5d3eabe', 'PP', '(077) 933-394_', 'cambodia', '10830542', 'default-profile.png', '', '', '', '', 'unavailable');
INSERT INTO "tbstudent" VALUES ('1053', 'Sovary', 'Kong', 'M', '1995-12-29', 'kongsovaryhrdi@gmail.com', 'fa585d89c851dd338a70dcf535aa2a92fee7836dd6aff1226583e88e0996293f16bc009c652826e0fc5c706695a03cddce372f139eff4d13959da6f1f5d3eabe', 'Sihanouk Ville', '(098) 651-956_', 'cambodia', '20842525', 'default-profile.png', '', '', '', '', 'unavailable');
INSERT INTO "tbstudent" VALUES ('1054', 'Sona', 'Ky', 'F', '1993-05-01', 'sona_ky@yahoo.com', 'fa585d89c851dd338a70dcf535aa2a92fee7836dd6aff1226583e88e0996293f16bc009c652826e0fc5c706695a03cddce372f139eff4d13959da6f1f5d3eabe', 'Takeo', '(010) 806-386_', 'cambodia', '10810450', 'default-profile.png', '', '', '', '', 'unavailable');
INSERT INTO "tbstudent" VALUES ('1055', 'Phalleak', 'Lach', 'M', '1992-04-30', 'lachphalleak70@gmail.com', 'fa585d89c851dd338a70dcf535aa2a92fee7836dd6aff1226583e88e0996293f16bc009c652826e0fc5c706695a03cddce372f139eff4d13959da6f1f5d3eabe', 'Kompong Thom', '(096) 596-7596', 'cambodia', '150471442', 'default-profile.png', '', '', '', '', 'unavailable');
INSERT INTO "tbstudent" VALUES ('1056', 'Ponlork', 'Leav', 'M', '1990-04-23', 'ponlorkleav168@gmail.com', 'fa585d89c851dd338a70dcf535aa2a92fee7836dd6aff1226583e88e0996293f16bc009c652826e0fc5c706695a03cddce372f139eff4d13959da6f1f5d3eabe', 'Prey Veng', '(010) 994-596_', 'cambodia', '50756089', 'default-profile.png', '', '', '', '', 'unavailable');
INSERT INTO "tbstudent" VALUES ('1057', 'Seudy', 'Lim', 'M', '1993-10-28', 'seudylim@gmail.com', 'fa585d89c851dd338a70dcf535aa2a92fee7836dd6aff1226583e88e0996293f16bc009c652826e0fc5c706695a03cddce372f139eff4d13959da6f1f5d3eabe', 'BMC', '(017) 255-812_', 'cambodia', '190506950', 'default-profile.png', '', '', '', '', 'unavailable');
INSERT INTO "tbstudent" VALUES ('1058', 'Rattanak', 'Lorn', 'M', '1991-04-24', 'nak.khmer@gmail.com', 'fa585d89c851dd338a70dcf535aa2a92fee7836dd6aff1226583e88e0996293f16bc009c652826e0fc5c706695a03cddce372f139eff4d13959da6f1f5d3eabe', 'Kandal', '(087) 444-593_', 'cambodia', '20921526', 'default-profile.png', '', '', '', '', 'unavailable');
INSERT INTO "tbstudent" VALUES ('1059', 'Vorthana', 'Meas', 'M', '1993-08-10', 'm.vorthana@gmail.com', 'fa585d89c851dd338a70dcf535aa2a92fee7836dd6aff1226583e88e0996293f16bc009c652826e0fc5c706695a03cddce372f139eff4d13959da6f1f5d3eabe', 'Kompong Thom', '(087) 242-474_', 'cambodia', '150587887', 'default-profile.png', '', '', '', '', 'unavailable');
INSERT INTO "tbstudent" VALUES ('1060', 'Ponnreay', 'Nouv', 'M', '1994-05-03', 'ponnreay.nouv@gmail.com', 'fa585d89c851dd338a70dcf535aa2a92fee7836dd6aff1226583e88e0996293f16bc009c652826e0fc5c706695a03cddce372f139eff4d13959da6f1f5d3eabe', 'PP', '(010) 457-025_', 'cambodia', '', 'default-profile.png', '', '', '', '', 'unavailable');
INSERT INTO "tbstudent" VALUES ('1061', 'Ravuth ', 'Oeurn ', 'M', '1993-07-12', 'oravuth@gmail.com', 'fa585d89c851dd338a70dcf535aa2a92fee7836dd6aff1226583e88e0996293f16bc009c652826e0fc5c706695a03cddce372f139eff4d13959da6f1f5d3eabe', 'Kompong Speu', '(015) 969-624_', 'cambodia', '30484126', 'default-profile.png', '', '', '', '', 'unavailable');
INSERT INTO "tbstudent" VALUES ('1062', ' Dara', 'Po', 'M', '1993-05-17', '', 'fa585d89c851dd338a70dcf535aa2a92fee7836dd6aff1226583e88e0996293f16bc009c652826e0fc5c706695a03cddce372f139eff4d13959da6f1f5d3eabe', 'Kandal', '(093) 757-044_', 'cambodia', '20866988', 'default-profile.png', '', '', '', '', 'unavailable');
INSERT INTO "tbstudent" VALUES ('1063', 'Piseth', 'Prom ', 'M', '1994-09-23', 'pisethprom7@gmail.com', 'fa585d89c851dd338a70dcf535aa2a92fee7836dd6aff1226583e88e0996293f16bc009c652826e0fc5c706695a03cddce372f139eff4d13959da6f1f5d3eabe', 'Kandal', '(097) 226-6576', 'cambodia', '20881745', 'default-profile.png', '', '', '', '', 'unavailable');
INSERT INTO "tbstudent" VALUES ('1064', 'Phearun', 'Rath ', 'M', '1994-01-02', 'rathphearun123@gmail.com', 'fa585d89c851dd338a70dcf535aa2a92fee7836dd6aff1226583e88e0996293f16bc009c652826e0fc5c706695a03cddce372f139eff4d13959da6f1f5d3eabe', 'Kandal', '(098) 490-268_', 'cambodia', '20839443', 'default-profile.png', '', '', '', '', 'unavailable');
INSERT INTO "tbstudent" VALUES ('1065', ' Kimchhoin ', 'Sok', 'M', '1993-06-03', 'sokkimchhoin@gmail.com', 'fa585d89c851dd338a70dcf535aa2a92fee7836dd6aff1226583e88e0996293f16bc009c652826e0fc5c706695a03cddce372f139eff4d13959da6f1f5d3eabe', 'Kandal', '(096) 262-1076', 'cambodia', '20847203', 'default-profile.png', '', '', '', '', 'unavailable');
INSERT INTO "tbstudent" VALUES ('1066', 'Sundy', 'Srun ', 'M', '1993-03-04', 'jame001sundy@gmail.com', 'fa585d89c851dd338a70dcf535aa2a92fee7836dd6aff1226583e88e0996293f16bc009c652826e0fc5c706695a03cddce372f139eff4d13959da6f1f5d3eabe', 'PP', '(086) 435-122_', 'cambodia', '10778808', 'default-profile.png', '', '', '', '', 'unavailable');
INSERT INTO "tbstudent" VALUES ('1067', ' Kheang', 'Sun', 'M', '1993-06-06', 'kheangsun@gmail.com', 'fa585d89c851dd338a70dcf535aa2a92fee7836dd6aff1226583e88e0996293f16bc009c652826e0fc5c706695a03cddce372f139eff4d13959da6f1f5d3eabe', 'Battambang', '(077) 332-212_', 'cambodia', '170605610', 'default-profile.png', '', '', '', '', 'unavailable');
INSERT INTO "tbstudent" VALUES ('1068', ' Mathearo ', 'Buth', 'M', '1993-12-26', 'mathearo.buth@gmail.com', 'fa585d89c851dd338a70dcf535aa2a92fee7836dd6aff1226583e88e0996293f16bc009c652826e0fc5c706695a03cddce372f139eff4d13959da6f1f5d3eabe', 'Kandal', '(010) 349-330_', 'cambodia', '50743594', 'default-profile.png', '', '', '', '', 'unavailable');
INSERT INTO "tbstudent" VALUES ('1069', ' Sovichea ', 'Cheth', 'M', '1992-08-15', 'sovichea.chet@gmail.com', 'fa585d89c851dd338a70dcf535aa2a92fee7836dd6aff1226583e88e0996293f16bc009c652826e0fc5c706695a03cddce372f139eff4d13959da6f1f5d3eabe', 'Battambang', '(017) 943-007_', 'cambodia', '10688718', 'default-profile.png', '', '', '', '', 'unavailable');
INSERT INTO "tbstudent" VALUES ('1070', 'Manith', 'Eath ', 'F', '1993-05-12', 'eath.manith@gmail.com', 'fa585d89c851dd338a70dcf535aa2a92fee7836dd6aff1226583e88e0996293f16bc009c652826e0fc5c706695a03cddce372f139eff4d13959da6f1f5d3eabe', 'PP', '(010) 966-475_', 'cambodia', '10772310', 'default-profile.png', '', '', '', '', 'unavailable');
INSERT INTO "tbstudent" VALUES ('1071', 'Kaoly', 'Chheng', 'M', '1994-02-07', 'kaolychheng @yahoo.com', 'fa585d89c851dd338a70dcf535aa2a92fee7836dd6aff1226583e88e0996293f16bc009c652826e0fc5c706695a03cddce372f139eff4d13959da6f1f5d3eabe', 'Phonm Penh', '(089) 984-854_', 'cambodia', 'ID190470860', 'default-profile.png', '', '', '', '', 'unavailable');
INSERT INTO "tbstudent" VALUES ('1072', 'Vy', 'Em', 'M', '1991-10-10', 'v.em @ovi.com', 'fa585d89c851dd338a70dcf535aa2a92fee7836dd6aff1226583e88e0996293f16bc009c652826e0fc5c706695a03cddce372f139eff4d13959da6f1f5d3eabe', '#11D, St. 174, Toul Svay Prey II, Chamka Mon, PP', '(092) 851-295_', 'cambodia', 'ID160258469', 'default-profile.png', '', '', '', '', 'unavailable');
INSERT INTO "tbstudent" VALUES ('1073', 'Sambath', 'Heab ', 'M', '1992-08-03', 'heabsambath168@gmail.com', 'fa585d89c851dd338a70dcf535aa2a92fee7836dd6aff1226583e88e0996293f16bc009c652826e0fc5c706695a03cddce372f139eff4d13959da6f1f5d3eabe', 'Battambang', '(096) 777-8975', 'cambodia', '170652166', 'default-profile.png', '', '', '', '', 'unavailable');
INSERT INTO "tbstudent" VALUES ('1074', 'Pichponreay', 'Ly', 'M', '1994-10-10', 'Picponreayly@gmail.com', 'fa585d89c851dd338a70dcf535aa2a92fee7836dd6aff1226583e88e0996293f16bc009c652826e0fc5c706695a03cddce372f139eff4d13959da6f1f5d3eabe', 'Phnom Penh', '(017) 546-464_', 'cambodia', 'ID 010751765', 'default-profile.png', '', '', '', '', 'unavailable');
INSERT INTO "tbstudent" VALUES ('1075', ' Sy Some', 'Ho', 'M', '1989-09-21', 'ho.sysome@gmail.com', 'fa585d89c851dd338a70dcf535aa2a92fee7836dd6aff1226583e88e0996293f16bc009c652826e0fc5c706695a03cddce372f139eff4d13959da6f1f5d3eabe', 'PP', '(089) 560-027_', 'cambodia', '10710228', 'default-profile.png', '', '', '', '', 'unavailable');
INSERT INTO "tbstudent" VALUES ('1076', ' Ulvy', 'Sles', 'M', '1989-02-12', 'Slenulvy@gmail.com', 'fa585d89c851dd338a70dcf535aa2a92fee7836dd6aff1226583e88e0996293f16bc009c652826e0fc5c706695a03cddce372f139eff4d13959da6f1f5d3eabe', 'Phnom Penh', '(974) 534-803_', 'cambodia', 'ID 061225899', 'default-profile.png', '', '', '', '', 'unavailable');
INSERT INTO "tbstudent" VALUES ('1077', ' Kimhan', 'Houn', 'M', '1991-10-02', 'h.kim.han@gmail.com', 'fa585d89c851dd338a70dcf535aa2a92fee7836dd6aff1226583e88e0996293f16bc009c652826e0fc5c706695a03cddce372f139eff4d13959da6f1f5d3eabe', 'BMC', '(096) 773-2415', 'cambodia', '190410694', 'default-profile.png', '', '', '', '', 'unavailable');
INSERT INTO "tbstudent" VALUES ('1078', 'Chanthorn', 'Srou', 'M', '1991-06-08', 'Srouchanthorn@gmail.com', 'fa585d89c851dd338a70dcf535aa2a92fee7836dd6aff1226583e88e0996293f16bc009c652826e0fc5c706695a03cddce372f139eff4d13959da6f1f5d3eabe', 'Phnom Penh', '(088) 955-325_', 'cambodia', 'ID100694533', 'default-profile.png', '', '', '', '', 'unavailable');
INSERT INTO "tbstudent" VALUES ('1079', 'Vichearith', 'Seang', 'M', '1995-01-05', 'rith.measficont.9@gmail.com', 'fa585d89c851dd338a70dcf535aa2a92fee7836dd6aff1226583e88e0996293f16bc009c652826e0fc5c706695a03cddce372f139eff4d13959da6f1f5d3eabe', '#154, Prek Torl Village, Sangkat Steang Mean Chey, Phnom Penh', '(098) 332-871_', 'cambodia', 'ID10777890', 'default-profile.png', '', '', '', '', 'unavailable');
INSERT INTO "tbstudent" VALUES ('1080', 'Rotha', 'Khoeurn ', 'F', '1995-01-24', 'khoeurn.rotha@gmail.com', 'fa585d89c851dd338a70dcf535aa2a92fee7836dd6aff1226583e88e0996293f16bc009c652826e0fc5c706695a03cddce372f139eff4d13959da6f1f5d3eabe', 'Battambang', '(092) 663-480_', 'cambodia', '1707597907', 'default-profile.png', '', '', '', '', 'unavailable');
INSERT INTO "tbstudent" VALUES ('1081', ' Chhaly ', 'Chhorn', 'M', '1992-09-09', 'charliechorn@gmail .com', 'fa585d89c851dd338a70dcf535aa2a92fee7836dd6aff1226583e88e0996293f16bc009c652826e0fc5c706695a03cddce372f139eff4d13959da6f1f5d3eabe', 'St 150  Sangkat vealvong khan 7kakara,Phonm Penh', '(010) 576-020_', 'cambodia', 'ID10794098', 'default-profile.png', '', '', '', '', 'unavailable');
INSERT INTO "tbstudent" VALUES ('1082', ' Ravy', 'Lim', 'M', '1995-11-21', 'limravytop10@gmail.com', 'fa585d89c851dd338a70dcf535aa2a92fee7836dd6aff1226583e88e0996293f16bc009c652826e0fc5c706695a03cddce372f139eff4d13959da6f1f5d3eabe', 'Kompong Thom', '(015) 829-586_', 'cambodia', '150499125', 'default-profile.png', '', '', '', '', 'unavailable');
INSERT INTO "tbstudent" VALUES ('1083', 'Phearak ', 'Chuon', 'M', '1990-03-05', 'Phearak.cpr@gmail.com', 'fa585d89c851dd338a70dcf535aa2a92fee7836dd6aff1226583e88e0996293f16bc009c652826e0fc5c706695a03cddce372f139eff4d13959da6f1f5d3eabe', '#119, Nattou Road II, Sangkat Chak Angre Ler, Khan Mean Chey, PP', '(015) 657-998_', 'cambodia', 'ID100554356', 'default-profile.png', '', '', '', '', 'unavailable');
INSERT INTO "tbstudent" VALUES ('1084', 'Chitra', 'Sem', 'M', '1986-12-30', 'sabaychitra84@gmail.com', 'fa585d89c851dd338a70dcf535aa2a92fee7836dd6aff1226583e88e0996293f16bc009c652826e0fc5c706695a03cddce372f139eff4d13959da6f1f5d3eabe', 'Phnom Penh', '(086) 457-324_', 'cambodia', 'ID10533636', 'default-profile.png', '', '', '', '', 'unavailable');
INSERT INTO "tbstudent" VALUES ('1085', ' Liling', 'Meng', 'F', '1993-10-06', 'lilingmeng@ymail.com', 'fa585d89c851dd338a70dcf535aa2a92fee7836dd6aff1226583e88e0996293f16bc009c652826e0fc5c706695a03cddce372f139eff4d13959da6f1f5d3eabe', 'Kandal', '(010) 518-895_', 'cambodia', '20808822', 'default-profile.png', '', '', '', '', 'unavailable');
INSERT INTO "tbstudent" VALUES ('1086', 'Borith ', 'Tang', 'M', '1990-07-18', 'tborith@gmail.com', 'fa585d89c851dd338a70dcf535aa2a92fee7836dd6aff1226583e88e0996293f16bc009c652826e0fc5c706695a03cddce372f139eff4d13959da6f1f5d3eabe', 'St 193, 35Eo Sangkat Toul Svay Prey,Khan Chamkarmon, PP', '(011) 689-559_', 'cambodia', 'ID10640750', 'default-profile.png', '', '', '', '', 'unavailable');
INSERT INTO "tbstudent" VALUES ('1087', 'Sopheak', 'Nem ', 'M', '1986-01-18', 'nemsopheak@gmail.com', 'fa585d89c851dd338a70dcf535aa2a92fee7836dd6aff1226583e88e0996293f16bc009c652826e0fc5c706695a03cddce372f139eff4d13959da6f1f5d3eabe', 'PP', '(012) 966-848_', 'cambodia', '10500231', 'default-profile.png', '', '', '', '', 'unavailable');
INSERT INTO "tbstudent" VALUES ('1088', 'Vichith', 'Toma', 'M', '1992-01-03', 'toma Vichith77@gmail.com', 'fa585d89c851dd338a70dcf535aa2a92fee7836dd6aff1226583e88e0996293f16bc009c652826e0fc5c706695a03cddce372f139eff4d13959da6f1f5d3eabe', 'Phnom Penh', '(078) 838-251_', 'cambodia', 'ID20828371', 'default-profile.png', '', '', '', '', 'unavailable');
INSERT INTO "tbstudent" VALUES ('1089', ' Vannak', 'Ny', 'M', '1991-08-04', 'nynit09@gmail.com', 'fa585d89c851dd338a70dcf535aa2a92fee7836dd6aff1226583e88e0996293f16bc009c652826e0fc5c706695a03cddce372f139eff4d13959da6f1f5d3eabe', 'PP', '(011) 333-544_', 'cambodia', '61381567', 'default-profile.png', '', '', '', '', 'unavailable');
INSERT INTO "tbstudent" VALUES ('1090', 'Voneat', 'Pen', 'F', '1994-04-18', 'Pen Voneat@gmail.com', 'fa585d89c851dd338a70dcf535aa2a92fee7836dd6aff1226583e88e0996293f16bc009c652826e0fc5c706695a03cddce372f139eff4d13959da6f1f5d3eabe', '# 29G ,Chrog Changva District, Khan Russey Keo, Phnom Penh', '(070) 200-825_', 'cambodia', 'ID10773375', 'default-profile.png', '', '', '', '', 'unavailable');
INSERT INTO "tbstudent" VALUES ('1091', ' Reksmey', 'Ok', 'M', '1977-10-15', 'okreksmey@gmail.com', 'fa585d89c851dd338a70dcf535aa2a92fee7836dd6aff1226583e88e0996293f16bc009c652826e0fc5c706695a03cddce372f139eff4d13959da6f1f5d3eabe', 'Kratie', '(012) 450-560_', 'cambodia', '10367325', 'default-profile.png', '', '', '', '', 'unavailable');
INSERT INTO "tbstudent" VALUES ('1092', ' Borey', 'Houng', 'M', '1989-08-13', 'Houng Boreyrupp@gmail.com', 'fa585d89c851dd338a70dcf535aa2a92fee7836dd6aff1226583e88e0996293f16bc009c652826e0fc5c706695a03cddce372f139eff4d13959da6f1f5d3eabe', '#25, St.242, Sangkat Boeug Prolit, Khan 7 Makara, Phnom Penh', '(081) 978-080_', 'cambodia', 'ID61054214', 'default-profile.png', '', '', '', '', 'unavailable');
INSERT INTO "tbstudent" VALUES ('1093', ' Vandet', 'Pann', 'M', '1991-12-09', 'pannvandet@gmail.com', 'fa585d89c851dd338a70dcf535aa2a92fee7836dd6aff1226583e88e0996293f16bc009c652826e0fc5c706695a03cddce372f139eff4d13959da6f1f5d3eabe', 'Kompong Thom', '(070) 785-595_', 'combodia', '61201300', 'default-profile.png', '', '', '', '', 'unavailable');
INSERT INTO "tbstudent" VALUES ('1094', ' Virak', 'Sim', 'M', '1991-02-15', 'Simvirak7@gmail.com', 'fa585d89c851dd338a70dcf535aa2a92fee7836dd6aff1226583e88e0996293f16bc009c652826e0fc5c706695a03cddce372f139eff4d13959da6f1f5d3eabe', 'St. 2, Chak Angre Krom Commune, Mean Chey District, PP', '(070) 479-884_', 'cambodia', 'ID010689154', 'default-profile.png', '', '', '', '', 'unavailable');
INSERT INTO "tbstudent" VALUES ('1095', 'Phearum', 'Phal ', 'M', '1993-01-10', 'phearum.phal@gmail.com', 'fa585d89c851dd338a70dcf535aa2a92fee7836dd6aff1226583e88e0996293f16bc009c652826e0fc5c706695a03cddce372f139eff4d13959da6f1f5d3eabe', 'Kampong Cham', '(069) 205-037_', 'cambodia', '61348202', 'default-profile.png', '', '', '', '', 'unavailable');
INSERT INTO "tbstudent" VALUES ('1096', 'Vuthea', 'Chheang', 'M', '1994-10-10', 'Chheang .Vuthea@gmail.com', 'fa585d89c851dd338a70dcf535aa2a92fee7836dd6aff1226583e88e0996293f16bc009c652826e0fc5c706695a03cddce372f139eff4d13959da6f1f5d3eabe', '# 172, Toul Kork Village, Toul Sangke, Russey Keo, PP', '(097) 959-3388', 'cambodia', 'ID050688795', 'default-profile.png', '', '', '', '', 'unavailable');
INSERT INTO "tbstudent" VALUES ('1097', ' Pirang', 'Phan', 'M', '1992-01-10', 'pirang_phan@yahoo.com', 'fa585d89c851dd338a70dcf535aa2a92fee7836dd6aff1226583e88e0996293f16bc009c652826e0fc5c706695a03cddce372f139eff4d13959da6f1f5d3eabe', 'PP', '(016) 747-264_', 'cambodia', '10704846', 'default-profile.png', '', '', '', '', 'unavailable');
INSERT INTO "tbstudent" VALUES ('1098', 'Vichet ', 'Sai', 'M', '1992-05-25', 'Sai .Vichet 70@gmail.com', 'fa585d89c851dd338a70dcf535aa2a92fee7836dd6aff1226583e88e0996293f16bc009c652826e0fc5c706695a03cddce372f139eff4d13959da6f1f5d3eabe', 'Tropang Chhuk, Sangkat Toek Thla, Khan Sen Sok, PP', '(012) 562-873_', 'cambodia', 'ID150587721', 'default-profile.png', '', '', '', '', 'unavailable');
INSERT INTO "tbstudent" VALUES ('1099', ' Oudam', 'Seng', 'M', '1992-09-12', 'sengoudam.ppwsa112013@gmail.com', 'fa585d89c851dd338a70dcf535aa2a92fee7836dd6aff1226583e88e0996293f16bc009c652826e0fc5c706695a03cddce372f139eff4d13959da6f1f5d3eabe', 'Pursat', '(070) 906-308_', 'cambodia', '160285692', 'default-profile.png', '', '', '', '', 'unavailable');
INSERT INTO "tbstudent" VALUES ('1100', 'Siyan', 'Ya', 'M', '1991-12-31', '2akariya-saet@yahoo.com', 'fa585d89c851dd338a70dcf535aa2a92fee7836dd6aff1226583e88e0996293f16bc009c652826e0fc5c706695a03cddce372f139eff4d13959da6f1f5d3eabe', 'St. Tonle Sap, 98, Sangkat Chroy Chong Var, Khan Russey Keo, PP', '(976) 979-013_', 'cambodia', 'ID160281005', 'default-profile.png', '', '', '', '', 'unavailable');
INSERT INTO "tbstudent" VALUES ('1101', ' Longdy', 'Torn', 'M', '1995-10-10', 'longdygold@gmail.com', 'fa585d89c851dd338a70dcf535aa2a92fee7836dd6aff1226583e88e0996293f16bc009c652826e0fc5c706695a03cddce372f139eff4d13959da6f1f5d3eabe', 'Pursat', '(069) 459-949_', 'cambodia', '160280071', 'default-profile.png', '', '', '', '', 'unavailable');
INSERT INTO "tbstudent" VALUES ('1102', 'Vuthy', 'Preap', 'M', '1992-07-10', 'itPreap. Vuthy@hahoo.com', 'fa585d89c851dd338a70dcf535aa2a92fee7836dd6aff1226583e88e0996293f16bc009c652826e0fc5c706695a03cddce372f139eff4d13959da6f1f5d3eabe', '29Eo,âSt. 554, Sangkat Boeug Kok I , Khan Toul Kork, PP', '(086) 875-825_', 'cmabodia', 'ID10750929', 'default-profile.png', '', '', '', '', 'unavailable');
INSERT INTO "tbstudent" VALUES ('1103', 'Longdy', 'Torn ', 'M', '1995-10-10', 'shin.khboy@gmail.com', 'fa585d89c851dd338a70dcf535aa2a92fee7836dd6aff1226583e88e0996293f16bc009c652826e0fc5c706695a03cddce372f139eff4d13959da6f1f5d3eabe', 'Pursat', '(069) 459-949_', 'cambodia', '160280071', 'default-profile.png', '', '', '', '', 'unavailable');
INSERT INTO "tbstudent" VALUES ('1104', ' Elen', 'Roth', 'F', '1994-10-14', 'roth_elen@hotmail.com', 'fa585d89c851dd338a70dcf535aa2a92fee7836dd6aff1226583e88e0996293f16bc009c652826e0fc5c706695a03cddce372f139eff4d13959da6f1f5d3eabe', '#1460, St. 4A , Klang Sang Village, Khan Russey Keo,  PP', '(015) 224-338_', 'cambodia', 'ID010773130', 'default-profile.png', '', '', '', '', 'unavailable');
INSERT INTO "tbstudent" VALUES ('1105', ' Ishin', 'Vin', 'M', '1995-03-20', 'shin.khboy@gmail.com', 'fa585d89c851dd338a70dcf535aa2a92fee7836dd6aff1226583e88e0996293f16bc009c652826e0fc5c706695a03cddce372f139eff4d13959da6f1f5d3eabe', 'Siem Reap', '(093) 557-000_', 'cambodia', '180473325', 'default-profile.png', '', '', '', '', 'unavailable');
INSERT INTO "tbstudent" VALUES ('1106', ' Kokpheng ', 'Yin', 'M', '1991-10-09', 'yinkokpheng@yahoo.com', 'fa585d89c851dd338a70dcf535aa2a92fee7836dd6aff1226583e88e0996293f16bc009c652826e0fc5c706695a03cddce372f139eff4d13959da6f1f5d3eabe', 'PP', '(010) 839-775_', 'cambodia', '10672119', 'default-profile.png', '', '', '', '', 'unavailable');
INSERT INTO "tbstudent" VALUES ('1107', ' Penhchet', 'Dara', 'M', '1992-03-01', 'darapenhchet@gmail.com', 'fa585d89c851dd338a70dcf535aa2a92fee7836dd6aff1226583e88e0996293f16bc009c652826e0fc5c706695a03cddce372f139eff4d13959da6f1f5d3eabe', '# 13F, Tangov Village, Sangkat Nirot, Khan Meanchey, Phnom Penh', '(086) 961-919_', 'cambodia', 'ID 010686425', 'default-profile.png', '', '', '', '', 'unavailable');
INSERT INTO "tbstudent" VALUES ('1108', ' Bora ', 'Chann', 'M', '1993-04-06', 'borachann@gmail.com', 'fa585d89c851dd338a70dcf535aa2a92fee7836dd6aff1226583e88e0996293f16bc009c652826e0fc5c706695a03cddce372f139eff4d13959da6f1f5d3eabe', 'St. 213, Sangkat Vel Vong, Khan 7 Makara, Phnom Penh', '(098) 497-244_', 'cambodia', 'ID 061171175', 'default-profile.png', '', '', '', '', 'unavailable');
INSERT INTO "tbstudent" VALUES ('1109', ' Pumeoung', 'Chang', 'M', '1993-03-27', 'chang.pumeoung@gmail.com', 'fa585d89c851dd338a70dcf535aa2a92fee7836dd6aff1226583e88e0996293f16bc009c652826e0fc5c706695a03cddce372f139eff4d13959da6f1f5d3eabe', '#61, St. 156, Sangkat Phsar Depo I, Khan Toul Kork, Phnom Penh', '(010) 771-331_', 'cambodia', 'ID 010738374', 'default-profile.png', '', '', '', '', 'unavailable');
INSERT INTO "tbstudent" VALUES ('1110', ' Tola ', 'Pheng', 'M', '1993-10-16', 'tolapheng99@gmail.com', 'fa585d89c851dd338a70dcf535aa2a92fee7836dd6aff1226583e88e0996293f16bc009c652826e0fc5c706695a03cddce372f139eff4d13959da6f1f5d3eabe', '#48E, St. 265, Sangkat Teakleak III, Khan Toal Kork, Phnom Penh', '(093) 982-898_', 'cambodia', 'ID 010737090', 'default-profile.png', '', '', '', '', 'unavailable');
INSERT INTO "tbstudent" VALUES ('1111', ' Sowattana', 'Menh', 'M', '1993-05-31', 'menhsowattana168@gmail.com', 'fa585d89c851dd338a70dcf535aa2a92fee7836dd6aff1226583e88e0996293f16bc009c652826e0fc5c706695a03cddce372f139eff4d13959da6f1f5d3eabe', '# 219, St. 42Bis, Sangkat Phnom Penh Thmey, Khan Sen Sok, Phnom Penh', '(010) 520-890_', 'cambodia', 'ID 010762369', 'default-profile.png', '', '', '', '', 'unavailable');
INSERT INTO "tbstudent" VALUES ('1112', ' Chhunleng', 'Hou', 'M', '1986-04-05', 'huochhunleng@yahoo.com', 'fa585d89c851dd338a70dcf535aa2a92fee7836dd6aff1226583e88e0996293f16bc009c652826e0fc5c706695a03cddce372f139eff4d13959da6f1f5d3eabe', 'St. 45, Toul Sangke, Russey Keo, Phnom Penh', '(010) 583-382_', 'cambodia', 'ID 060894252', 'default-profile.png', '', '', '', '', 'unavailable');
INSERT INTO "tbstudent" VALUES ('1113', ' Veasna', 'Sous', 'M', '1993-07-07', 'veasnasous@yahoo.com', 'fa585d89c851dd338a70dcf535aa2a92fee7836dd6aff1226583e88e0996293f16bc009c652826e0fc5c706695a03cddce372f139eff4d13959da6f1f5d3eabe', 'Phnom Penh', '(070) 831-921_', 'cambodia', 'ID 010736016', 'default-profile.png', '', '', '', '', 'unavailable');
INSERT INTO "tbstudent" VALUES ('1114', 'Chhorvy ', 'Chhorm ', 'F', '0002-07-03', 'Chhormchhorvyit@gmail.com', 'fa585d89c851dd338a70dcf535aa2a92fee7836dd6aff1226583e88e0996293f16bc009c652826e0fc5c706695a03cddce372f139eff4d13959da6f1f5d3eabe', 'Beuongkok, Sraschork, Don Penh, Phnom Penh', '(010) 860-120_', 'cambodia', 'ID 070213592', 'default-profile.png', '', '', '', '', 'unavailable');
INSERT INTO "tbstudent" VALUES ('1115', 'Darathana', 'Song ', 'F', '1992-10-12', 'songdarathana@gmail.com', 'fa585d89c851dd338a70dcf535aa2a92fee7836dd6aff1226583e88e0996293f16bc009c652826e0fc5c706695a03cddce372f139eff4d13959da6f1f5d3eabe', '#1571, St. 2, Sangkat Chak Angre Krom, Khan Mean Chey, PP', '(012) 311-363_', 'cambodia', 'ID010689086', 'default-profile.png', '', '', '', '', 'unavailable');
INSERT INTO "tbstudent" VALUES ('1116', 'Keanan', 'Hou ', 'M', '1991-08-05', 'keanan-hou@hotmail.com', 'fa585d89c851dd338a70dcf535aa2a92fee7836dd6aff1226583e88e0996293f16bc009c652826e0fc5c706695a03cddce372f139eff4d13959da6f1f5d3eabe', 'Phnom Penh', '(088) 960-9700', 'cambodia', 'ID 030520590', 'default-profile.png', '', '', '', '', 'unavailable');
INSERT INTO "tbstudent" VALUES ('1117', ' Koui Pheng ', 'Lee', 'M', '1991-01-11', 'Lee.pheng92@yahoo.com', 'fa585d89c851dd338a70dcf535aa2a92fee7836dd6aff1226583e88e0996293f16bc009c652826e0fc5c706695a03cddce372f139eff4d13959da6f1f5d3eabe', '# 7A, St. 257D, Sangkat Beoung Salang, Khan Toul Kork, Phnom Penh', '(068) 777-257_', 'cambodia', 'ID 010669918', 'default-profile.png', '', '', '', '', 'unavailable');
INSERT INTO "tbstudent" VALUES ('1118', ' Yuth', 'Set', 'M', '1989-05-03', 'syuth89@gmail.com', 'fa585d89c851dd338a70dcf535aa2a92fee7836dd6aff1226583e88e0996293f16bc009c652826e0fc5c706695a03cddce372f139eff4d13959da6f1f5d3eabe', 'Chack Angle Loeu, Khan Meanchey, Phnom Penh', '(088) 800-8776', 'cambodia', '088 800 8776', 'default-profile.png', '', '', '', '', 'unavailable');
INSERT INTO "tbstudent" VALUES ('1119', ' Chhaly ', 'Chhorn', 'M', '1992-09-09', 'charliechorn@gmail .com', 'fa585d89c851dd338a70dcf535aa2a92fee7836dd6aff1226583e88e0996293f16bc009c652826e0fc5c706695a03cddce372f139eff4d13959da6f1f5d3eabe', 'St 150  Sangkat vealvong khan 7kakara,Phonm Penh', '(010) 576-020_', 'cambodia', 'ID10794098', 'default-profile.png', '', '', '', '', 'unavailable');
INSERT INTO "tbstudent" VALUES ('1120', ' Chitra', 'Sem', 'M', '1986-11-30', 'tborith@gmail.com', 'fa585d89c851dd338a70dcf535aa2a92fee7836dd6aff1226583e88e0996293f16bc009c652826e0fc5c706695a03cddce372f139eff4d13959da6f1f5d3eabe', 'St 193, 35Eo Sangkat Toul Svay Prey,Khan Chamkarmon, PP', '(011) 689-559_', 'cambodia', 'ID10640750', 'default-profile.png', '', '', '', '', 'unavailable');
INSERT INTO "tbstudent" VALUES ('1121', ' Piseth', 'Ing', 'M', '1990-02-01', 'sovann.piseth.new@gmail.com', 'fa585d89c851dd338a70dcf535aa2a92fee7836dd6aff1226583e88e0996293f16bc009c652826e0fc5c706695a03cddce372f139eff4d13959da6f1f5d3eabe', '#110,st. 93 Tuol Sangke , Reusey keo ,Phnom Penh', '(077) 363-563_', 'cmabodia', 'ID 140078404', 'default-profile.png', '', '', '', '', 'unavailable');
INSERT INTO "tbstudent" VALUES ('1122', 'Vichith', 'Toma ', 'M', '1992-01-03', 'toma Vichith77@gmail.com', 'fa585d89c851dd338a70dcf535aa2a92fee7836dd6aff1226583e88e0996293f16bc009c652826e0fc5c706695a03cddce372f139eff4d13959da6f1f5d3eabe', 'Phnom Penh', '(078) 838-251_', 'cambodia', 'ID20828371', 'default-profile.png', '', '', '', '', 'unavailable');
INSERT INTO "tbstudent" VALUES ('1123', ' Sunleng', 'Lao', 'M', '1992-06-18', 'sunlenglao@gmail.com', 'fa585d89c851dd338a70dcf535aa2a92fee7836dd6aff1226583e88e0996293f16bc009c652826e0fc5c706695a03cddce372f139eff4d13959da6f1f5d3eabe', '#162, St. 192, Sangkat Terk Laork III, Toul Kork, PP', '(092) 847-548_', 'cambodia', 'ID 180496804', 'default-profile.png', '', '', '', '', 'unavailable');
INSERT INTO "tbstudent" VALUES ('1124', ' Sorady', 'Sonn', 'M', '1992-06-14', 'nhimchanborey@gmail.com', 'fa585d89c851dd338a70dcf535aa2a92fee7836dd6aff1226583e88e0996293f16bc009c652826e0fc5c706695a03cddce372f139eff4d13959da6f1f5d3eabe', '#352E1, St. 215, DepoIII , Toul kok ,Phnom Penh', '(010) 430-930_', 'cambodia', 'ID 010684190', 'default-profile.png', '', '', '', '', 'unavailable');
INSERT INTO "tbstudent" VALUES ('1125', ' Voneat', 'Pen', 'F', '1994-04-18', 'Pen Voneat@gmail.com', 'fa585d89c851dd338a70dcf535aa2a92fee7836dd6aff1226583e88e0996293f16bc009c652826e0fc5c706695a03cddce372f139eff4d13959da6f1f5d3eabe', '# 29G ,Chrog Changva District, Khan Russey Keo, Phnom Penh', '(070) 200-825_', 'cambodia', 'ID10773375', 'default-profile.png', '', '', '', '', 'unavailable');
INSERT INTO "tbstudent" VALUES ('1126', ' Bunthon', 'Mao', 'M', '1993-10-18', 'maobunthon168@gmail.com', 'fa585d89c851dd338a70dcf535aa2a92fee7836dd6aff1226583e88e0996293f16bc009c652826e0fc5c706695a03cddce372f139eff4d13959da6f1f5d3eabe', 'Sangkat Terk thla, Khan Sen Sok,Phnom Penh', '(096) 333-3095', 'cambodia', 'ID 010859340', 'default-profile.png', '', '', '', '', 'unavailable');
INSERT INTO "tbstudent" VALUES ('1127', ' Borey', 'Houng', 'M', '1989-08-13', 'Houng Boreyrupp@gmail.com', 'fa585d89c851dd338a70dcf535aa2a92fee7836dd6aff1226583e88e0996293f16bc009c652826e0fc5c706695a03cddce372f139eff4d13959da6f1f5d3eabe', '#25, St.242, Sangkat Boeug Prolit, Khan 7 Makara, Phnom Penh', '(081) 978-080_', 'cambodia', 'ID61054214', 'default-profile.png', '', '', '', '', 'unavailable');
INSERT INTO "tbstudent" VALUES ('1128', ' Sunleng', 'Lao', 'M', '1992-01-18', 'Krysophannatt@gmail.com', 'fa585d89c851dd338a70dcf535aa2a92fee7836dd6aff1226583e88e0996293f16bc009c652826e0fc5c706695a03cddce372f139eff4d13959da6f1f5d3eabe', 'Phnom Penh', '(092) 847-548_', 'cambodia', 'ID 180496804', 'default-profile.png', '', '', '', '', 'unavailable');
INSERT INTO "tbstudent" VALUES ('1129', ' Lengse', 'Hy', 'M', '1990-12-30', 'Hylengse@gmail.com', 'fa585d89c851dd338a70dcf535aa2a92fee7836dd6aff1226583e88e0996293f16bc009c652826e0fc5c706695a03cddce372f139eff4d13959da6f1f5d3eabe', '#63, St 161, Sangkat Boeng Salang, Khan Toul Kork, Phnom Penh', '(097) 706-6671', 'cambodia', 'ID 020830957', 'default-profile.png', '', '', '', '', 'unavailable');
INSERT INTO "tbstudent" VALUES ('1130', ' Socheat', 'Eam', 'M', '1992-01-17', 'eamsocheatsmart@gmail.com', 'fa585d89c851dd338a70dcf535aa2a92fee7836dd6aff1226583e88e0996293f16bc009c652826e0fc5c706695a03cddce372f139eff4d13959da6f1f5d3eabe', '#145, St. No, Sangkat Tek Tla Khan Sen Sok, Phnom Penh', '(098) 275-225_', 'cambodia', 'ID 070197249', 'default-profile.png', '', '', '', '', 'unavailable');
INSERT INTO "tbstudent" VALUES ('1131', ' Youty', 'Nguon', 'M', '1992-08-05', 'eamsocheatsmart@gmail.com', 'fa585d89c851dd338a70dcf535aa2a92fee7836dd6aff1226583e88e0996293f16bc009c652826e0fc5c706695a03cddce372f139eff4d13959da6f1f5d3eabe', '#145, St. No, Sangkat Tek Tla Khan Sen Sok, Phnom Penh', '(078) 803-006_', 'cambodia', 'ID 010808987', 'default-profile.png', '', '', '', '', 'unavailable');
INSERT INTO "tbstudent" VALUES ('1132', ' Youty', 'Nguon', 'M', '1992-08-05', 'nguonyouty@gmail.com', 'fa585d89c851dd338a70dcf535aa2a92fee7836dd6aff1226583e88e0996293f16bc009c652826e0fc5c706695a03cddce372f139eff4d13959da6f1f5d3eabe', '#301, St. No, Sangkat Prek Eng, Khan Mean Chey, Phnom Penh', '(078) 803-006_', 'cambodia', 'ID 010808987', 'default-profile.png', '', '', '', '', 'unavailable');
INSERT INTO "tbstudent" VALUES ('1133', ' Sokneang', 'Neng', 'F', '1991-05-03', 'Sokneang.2013@gmail.com', 'fa585d89c851dd338a70dcf535aa2a92fee7836dd6aff1226583e88e0996293f16bc009c652826e0fc5c706695a03cddce372f139eff4d13959da6f1f5d3eabe', 'Tboung Kdey Village, Bakou, Kandal Steong, Kandal', '(098) 651-551_', 'cambodia', 'ID 020963167', 'default-profile.png', '', '', '', '', 'unavailable');
INSERT INTO "tbstudent" VALUES ('1134', 'Sophannatt', 'Krey ', 'M', '1993-12-09', 'Krysophannatt@gmail.com', 'fa585d89c851dd338a70dcf535aa2a92fee7836dd6aff1226583e88e0996293f16bc009c652826e0fc5c706695a03cddce372f139eff4d13959da6f1f5d3eabe', 'Phnom Penh', '(086) 600-076_', 'cambodia', 'ID 040365805', 'default-profile.png', '', '', '', '', 'unavailable');
INSERT INTO "tbstudent" VALUES ('1135', ' Panharath', 'Chhun', 'M', '1993-03-20', 'Chhunpanharath@gmail.com', 'fa585d89c851dd338a70dcf535aa2a92fee7836dd6aff1226583e88e0996293f16bc009c652826e0fc5c706695a03cddce372f139eff4d13959da6f1f5d3eabe', '#63,St. 261, Sangkat Beoung Salang, Khan Toul kok, Phnom Penh', '(069) 878-286_', 'cambodia', 'ID 010739613', 'default-profile.png', '', '', '', '', 'unavailable');
INSERT INTO "tbstudent" VALUES ('1136', 'Gechleng', 'Ngor ', 'M', '1993-08-23', 'ngorgechleng@gmail.com', 'fa585d89c851dd338a70dcf535aa2a92fee7836dd6aff1226583e88e0996293f16bc009c652826e0fc5c706695a03cddce372f139eff4d13959da6f1f5d3eabe', '#230EO, St. 107, Sangkat Boeung Prolit, Khan 7 Makara, PP', '(010) 511-012_', 'cambodia', 'ID 010727039', 'default-profile.png', '', '', '', '', 'unavailable');
INSERT INTO "tbstudent" VALUES ('1137', 'Emareth ', 'Nut ', 'M', '1991-10-06', 'nutamet.help@gmail.com', 'fa585d89c851dd338a70dcf535aa2a92fee7836dd6aff1226583e88e0996293f16bc009c652826e0fc5c706695a03cddce372f139eff4d13959da6f1f5d3eabe', '#620,st 620, Sangkat Teak tha, Khan sen sok, Phnom Penh', '(096) 246-721_', 'cambodia', '', 'default-profile.png', '', '', '', '', 'unavailable');
INSERT INTO "tbstudent" VALUES ('1138', ' Sophearoth', 'Sim', 'M', '1991-12-03', 'simroth@ymail.com', 'fa585d89c851dd338a70dcf535aa2a92fee7836dd6aff1226583e88e0996293f16bc009c652826e0fc5c706695a03cddce372f139eff4d13959da6f1f5d3eabe', 'Phnom Penh', '(092) 993-136_', 'cambodia', 'ID 061129513', 'default-profile.png', '', '', '', '', 'unavailable');
INSERT INTO "tbstudent" VALUES ('1139', ' Lengse', 'Hy', 'M', '1990-12-30', 'Hylengse@gmail.com', 'fa585d89c851dd338a70dcf535aa2a92fee7836dd6aff1226583e88e0996293f16bc009c652826e0fc5c706695a03cddce372f139eff4d13959da6f1f5d3eabe', '#63, St 161, Sangkat Boeng Salang, Khan Toul Kork, Phnom Penh', '(097) 706-6671', 'cambodia', 'ID 020830957', 'default-profile.png', '', '', '', '', 'unavailable');
INSERT INTO "tbstudent" VALUES ('1140', ' Da', 'Prak', 'M', '1989-04-02', 'prakda99@yahoo.com', 'fa585d89c851dd338a70dcf535aa2a92fee7836dd6aff1226583e88e0996293f16bc009c652826e0fc5c706695a03cddce372f139eff4d13959da6f1f5d3eabe', 'Teok Thla, Sen Sok, Phnom Penh', '(093) 465-353_', 'cambodia', 'Family Book', 'default-profile.png', '', '', '', '', 'unavailable');
INSERT INTO "tbstudent" VALUES ('1141', 'Socheat', 'Eam ', 'M', '1992-06-17', 'eamsocheatsmart@gmail.com', 'fa585d89c851dd338a70dcf535aa2a92fee7836dd6aff1226583e88e0996293f16bc009c652826e0fc5c706695a03cddce372f139eff4d13959da6f1f5d3eabe', '#145, St. No, Sangkat Tek Tla Khan Sen Sok, Phnom Penh', '(098) 275-225_', 'cambodia', 'ID 070197249', 'default-profile.png', '', '', '', '', 'unavailable');
INSERT INTO "tbstudent" VALUES ('1142', 'Yo Vannaravuth', 'Yo ', 'M', '1990-07-02', 'Ravuth@gmail.com', 'fa585d89c851dd338a70dcf535aa2a92fee7836dd6aff1226583e88e0996293f16bc009c652826e0fc5c706695a03cddce372f139eff4d13959da6f1f5d3eabe', '# 81, St. 53, Beoung Tompon, Meanchey, PP', '(096) 457-7770', 'cambodia', 'ID 010649482', 'default-profile.png', '', '', '', '', 'unavailable');
INSERT INTO "tbstudent" VALUES ('1143', ' Sambo', 'Seth', 'M', '1992-06-29', 'Samboseth168@gmail.com', 'fa585d89c851dd338a70dcf535aa2a92fee7836dd6aff1226583e88e0996293f16bc009c652826e0fc5c706695a03cddce372f139eff4d13959da6f1f5d3eabe', '#543, St. 128, sangkat Phar DepoIII, Khan Toul Kok, Phnom Penh', '(086) 413-932_', 'cambodia', 'ID 010683705', 'default-profile.png', '', '', '', '', 'unavailable');
INSERT INTO "tbstudent" VALUES ('1144', ' Youty', 'Nguon', 'M', '1992-08-05', 'nguonyouty@gmail.com', 'fa585d89c851dd338a70dcf535aa2a92fee7836dd6aff1226583e88e0996293f16bc009c652826e0fc5c706695a03cddce372f139eff4d13959da6f1f5d3eabe', '#301, St. No, Sangkat Prek Eng, Khan Mean Chey, Phnom Penh', '(078) 803-006_', 'cambodia', 'ID 010808987', 'default-profile.png', '', '', '', '', 'unavailable');
INSERT INTO "tbstudent" VALUES ('1145', ' Bunramy', 'Ke', 'M', '1992-12-06', 'k.bunramy@yahoo.com', 'fa585d89c851dd338a70dcf535aa2a92fee7836dd6aff1226583e88e0996293f16bc009c652826e0fc5c706695a03cddce372f139eff4d13959da6f1f5d3eabe', '#45E, St. 182, Sangkat Orussey I, Khan 7 Makara, PP', '(010) 595-870_', 'cambodia', 'ID 010700404', 'default-profile.png', '', '', '', '', 'unavailable');
INSERT INTO "tbstudent" VALUES ('1146', ' Chanthy', 'Hit', 'M', '1992-03-02', 'phonvanna_author@yahoo.com', 'fa585d89c851dd338a70dcf535aa2a92fee7836dd6aff1226583e88e0996293f16bc009c652826e0fc5c706695a03cddce372f139eff4d13959da6f1f5d3eabe', '#4, St. 53bt, Kbal Tomnob, Boeung Tumpun, Mean Chhey, PP', '(077) 973-326_', 'cambodia', 'ID 160264684', 'default-profile.png', '', '', '', '', 'unavailable');
INSERT INTO "tbstudent" VALUES ('1147', 'Phally', 'Phuong ', 'M', '1991-02-18', 'phuongphally@gmail.com', 'fa585d89c851dd338a70dcf535aa2a92fee7836dd6aff1226583e88e0996293f16bc009c652826e0fc5c706695a03cddce372f139eff4d13959da6f1f5d3eabe', 'Phnom Penh', '(093) 532-371_', 'cambodia', 'ID 030563981', 'default-profile.png', '', '', '', '', 'unavailable');
INSERT INTO "tbstudent" VALUES ('1148', 'Malyka', 'Sin ', 'M', '1991-10-12', 'Malykasin@gmail.com', 'fa585d89c851dd338a70dcf535aa2a92fee7836dd6aff1226583e88e0996293f16bc009c652826e0fc5c706695a03cddce372f139eff4d13959da6f1f5d3eabe', '#617, St. 16, Sangkat Toul Sengke, Khan Toul Kok, Phnom Penh', '(010) 538-840_', 'cambodia', 'ID 040293891', 'default-profile.png', '', '', '', '', 'unavailable');
INSERT INTO "tbstudent" VALUES ('1149', ' Muny', 'Vaing', 'M', '1993-09-16', 'vaingmuny@gmail.com', 'fa585d89c851dd338a70dcf535aa2a92fee7836dd6aff1226583e88e0996293f16bc009c652826e0fc5c706695a03cddce372f139eff4d13959da6f1f5d3eabe', '#22B, St. 348, Beongkenkong III, Chamkamorn, Phnom Penh', '(093) 781-417_', 'cambodia', 'ID 010733942', 'default-profile.png', '', '', '', '', 'unavailable');
INSERT INTO "tbstudent" VALUES ('1150', ' Menghok', 'Heak', 'M', '1993-01-06', 'menghok.heak@gmail.com', 'fa585d89c851dd338a70dcf535aa2a92fee7836dd6aff1226583e88e0996293f16bc009c652826e0fc5c706695a03cddce372f139eff4d13959da6f1f5d3eabe', '#19Eo, St. 118, Phsar Thmey 1, Daun Penh, Phnom Penh', '(099) 768-481_', 'cambodia', 'ID 010736733', 'default-profile.png', '', '', '', '', 'unavailable');
INSERT INTO "tbstudent" VALUES ('1151', 'Socheat', 'Chea ', 'M', '1994-04-15', 'cheacheat.kh@gmail.com', 'fa585d89c851dd338a70dcf535aa2a92fee7836dd6aff1226583e88e0996293f16bc009c652826e0fc5c706695a03cddce372f139eff4d13959da6f1f5d3eabe', '#58A, St. 6A, Teuk Thla, Sen Sok, Phnom Penh', '(097) 972-6956', 'cambodia', 'ID 090481107', 'default-profile.png', '', '', '', '', 'unavailable');
INSERT INTO "tbstudent" VALUES ('1152', ' Vichhai', 'Kan', 'M', '1993-06-07', 'kanvichhai@gmail.com', 'fa585d89c851dd338a70dcf535aa2a92fee7836dd6aff1226583e88e0996293f16bc009c652826e0fc5c706695a03cddce372f139eff4d13959da6f1f5d3eabe', '#13A, Songkat Russey Keo, Khan Ressey Keo, Phnom Penh', '(012) 810-823_', 'cambodia', 'ID 010718272', 'default-profile.png', '', '', '', '', 'unavailable');
INSERT INTO "tbstudent" VALUES ('1153', 'Sokneang', 'Neng ', 'F', '1991-05-03', 'Sokneang.2013@gmail.com', 'fa585d89c851dd338a70dcf535aa2a92fee7836dd6aff1226583e88e0996293f16bc009c652826e0fc5c706695a03cddce372f139eff4d13959da6f1f5d3eabe', 'Tboung Kdey Village, Bakou, Kandal Steong, Kandal', '(098) 651-551_', 'cambodia', 'ID 020963167', 'default-profile.png', '', '', '', '', 'unavailable');
INSERT INTO "tbstudent" VALUES ('1154', 'Syla', 'Cha ', 'M', '1991-04-11', 'cha.syla1991@gmail.com', 'fa585d89c851dd338a70dcf535aa2a92fee7836dd6aff1226583e88e0996293f16bc009c652826e0fc5c706695a03cddce372f139eff4d13959da6f1f5d3eabe', 'St. 256, Sangkat Teok Laork I, Khan Tuol Kork, Phnom Penh', '(015) 419-283_', 'cambodia', 'ID 140071776', 'default-profile.png', '', '', '', '', 'unavailable');
INSERT INTO "tbstudent" VALUES ('1155', 'Gechleng', 'Ngor ', 'M', '1993-08-23', 'ngorgechleng@gmail.com', 'fa585d89c851dd338a70dcf535aa2a92fee7836dd6aff1226583e88e0996293f16bc009c652826e0fc5c706695a03cddce372f139eff4d13959da6f1f5d3eabe', '#230EO, St. 107, Sangkat Boeung Prolit, Khan 7 Makara, PP', '(010) 511-012_', 'cambodia', 'ID 010727039', 'default-profile.png', '', '', '', '', 'unavailable');
INSERT INTO "tbstudent" VALUES ('1156', 'Vantha', 'Ken ', 'M', '1990-11-10', 'vantha_ken@yahoo.com', 'e13efc991a9bf44bbb4da87cdbb725240184585ccaf270523170e008cf2a3b85f45f86c3da647f69780fb9e971caf5437b3d06d418355a68c9760c70a31d05c7', '#15E3, St. 109, Veang Vong Commune, 7 Makara District, PP', '(098) 257-995_', 'cambodia', 'ID 100546419', 'default-profile.png', '', '', '', '', 'unavailable');
INSERT INTO "tbstudent" VALUES ('1157', ' Sophearoth', 'Sim', 'M', '1991-12-03', 'simroth@ymail.com', 'fa585d89c851dd338a70dcf535aa2a92fee7836dd6aff1226583e88e0996293f16bc009c652826e0fc5c706695a03cddce372f139eff4d13959da6f1f5d3eabe', 'Phnom Penh', '(092) 993-136_', 'cambodia', 'ID 061129513', 'default-profile.png', '', '', '', '', 'unavailable');
INSERT INTO "tbstudent" VALUES ('1158', ' Ea Hang', 'Khov', 'M', '1994-05-06', 'Khov.eahang@gmail.com', 'fa585d89c851dd338a70dcf535aa2a92fee7836dd6aff1226583e88e0996293f16bc009c652826e0fc5c706695a03cddce372f139eff4d13959da6f1f5d3eabe', 'Sangkat Toul Sangke, Khan Toul Kork, Phnom Penh', '(077) 367-480_', 'cambodia', 'ID 160290176', 'default-profile.png', '', '', '', '', 'unavailable');
INSERT INTO "tbstudent" VALUES ('1159', ' Da', 'Prak', 'M', '1989-04-02', 'prakda99@yahoo.com', 'fa585d89c851dd338a70dcf535aa2a92fee7836dd6aff1226583e88e0996293f16bc009c652826e0fc5c706695a03cddce372f139eff4d13959da6f1f5d3eabe', 'Teok Thla, Sen Sok, Phnom Penh', '(093) 465-353_', 'cambodia', '', 'default-profile.png', '', '', '', '', 'unavailable');
INSERT INTO "tbstudent" VALUES ('1160', 'Channvichea', 'Kheng ', 'M', '1993-04-20', 'vichea@rocketmail.com', 'fa585d89c851dd338a70dcf535aa2a92fee7836dd6aff1226583e88e0996293f16bc009c652826e0fc5c706695a03cddce372f139eff4d13959da6f1f5d3eabe', '#73CEO, St. 122, Sangkat Phsar Deu 3, Khan Toul Kork, PP', '(017) 778-916_', 'cambodia', 'ID 010737358', 'default-profile.png', '', '', '', '', 'unavailable');
INSERT INTO "tbstudent" VALUES ('1161', ' Elsary', 'Chek', 'M', '1989-11-08', 'cheksaryby@gmail.com', 'fa585d89c851dd338a70dcf535aa2a92fee7836dd6aff1226583e88e0996293f16bc009c652826e0fc5c706695a03cddce372f139eff4d13959da6f1f5d3eabe', '#21, St. 1, Beoung Snour, Phnom Penh', '(077) 724-427_', 'cambodia', 'ID 17076895', 'default-profile.png', '', '', '', '', 'unavailable');
INSERT INTO "tbstudent" VALUES ('1162', 'Vannaravuth', 'Yo ', 'M', '1990-07-02', 'Ravuth@gmail.com', 'fa585d89c851dd338a70dcf535aa2a92fee7836dd6aff1226583e88e0996293f16bc009c652826e0fc5c706695a03cddce372f139eff4d13959da6f1f5d3eabe', '# 81, St. 53, Beoung Tompon, Meanchey, PP', '(096) 457-7770', 'cambodia', 'ID 010649482', 'default-profile.png', '', '', '', '', 'unavailable');
INSERT INTO "tbstudent" VALUES ('1163', ' Daneth ', 'Horn', 'M', '1993-02-19', 'horndaneth3@gmail.com', 'fa585d89c851dd338a70dcf535aa2a92fee7836dd6aff1226583e88e0996293f16bc009c652826e0fc5c706695a03cddce372f139eff4d13959da6f1f5d3eabe', 'Bangkok II, Toul Kork District, Phnom Penh', '(070) 725-748_', 'cambodia', 'ID 061205703', 'default-profile.png', '', '', '', '', 'unavailable');
INSERT INTO "tbstudent" VALUES ('1164', 'Rony', 'Zasty ', 'M', '1991-06-10', 'zastyrony@yohoo.com', 'fa585d89c851dd338a70dcf535aa2a92fee7836dd6aff1226583e88e0996293f16bc009c652826e0fc5c706695a03cddce372f139eff4d13959da6f1f5d3eabe', '#414, St. 5, Chrang Chomres I, Ressey Keo, PP ', '(069) 633-751_', 'cambodia', 'ID 010719377', 'default-profile.png', '', '', '', '', 'unavailable');
INSERT INTO "tbstudent" VALUES ('1165', ' Saksonita', 'Khoeurn', 'F', '1992-08-08', 'saksonita@gmail.com', 'fa585d89c851dd338a70dcf535aa2a92fee7836dd6aff1226583e88e0996293f16bc009c652826e0fc5c706695a03cddce372f139eff4d13959da6f1f5d3eabe', 'Phnom Penh', '(974) 015-374_', 'cambodia', 'ID 021008347', 'default-profile.png', '', '', '', '', 'unavailable');
INSERT INTO "tbstudent" VALUES ('1166', ' Bunrong', 'Leang', 'M', '1993-04-05', 'bunrongleang@gmail.com', 'fa585d89c851dd338a70dcf535aa2a92fee7836dd6aff1226583e88e0996293f16bc009c652826e0fc5c706695a03cddce372f139eff4d13959da6f1f5d3eabe', 'Sangkat Vel Vong , Khan 7 Makara, Phnom Penh', '(017) 220-707_', 'camodia', 'ID 061160842', 'default-profile.png', '', '', '', '', 'unavailable');
INSERT INTO "tbstudent" VALUES ('1167', ' Sreynav', 'Huon', 'F', '1993-02-06', 'sreyav9@gmail.com', 'fa585d89c851dd338a70dcf535aa2a92fee7836dd6aff1226583e88e0996293f16bc009c652826e0fc5c706695a03cddce372f139eff4d13959da6f1f5d3eabe', '#75DE4, St. 217, Ourussey III, 7 Makara, Phnom Phnom Penh', '(092) 290-272_', 'cambodia', 'ID 170700444', 'default-profile.png', '', '', '', '', 'unavailable');
INSERT INTO "tbstudent" VALUES ('1168', ' Udam', 'Chheng', 'M', '1990-10-13', 'udamchheng@gmail.com', 'fa585d89c851dd338a70dcf535aa2a92fee7836dd6aff1226583e88e0996293f16bc009c652826e0fc5c706695a03cddce372f139eff4d13959da6f1f5d3eabe', '#41AE1, St. 330, Sangkat Beung Keng Kang III, Khan Chamkarmon, PP', '(070) 871-244_', 'cambodia', 'ID 010642588', 'default-profile.png', '', '', '', '', 'unavailable');
INSERT INTO "tbstudent" VALUES ('1169', ' Sokheng', 'Lim', 'F', '1993-01-13', 'lim.sokheng1@gmail.com', 'fa585d89c851dd338a70dcf535aa2a92fee7836dd6aff1226583e88e0996293f16bc009c652826e0fc5c706695a03cddce372f139eff4d13959da6f1f5d3eabe', '#73, Sangkat Teak Laork III, Khan Toul Kork, Phnom Penh', '(093) 693-648_', 'cambodia', 'ID 061152504', 'default-profile.png', '', '', '', '', 'unavailable');
INSERT INTO "tbstudent" VALUES ('1170', ' Bunna', 'Choeung', 'M', '1993-11-18', 'bunnach@gmail.com', 'fa585d89c851dd338a70dcf535aa2a92fee7836dd6aff1226583e88e0996293f16bc009c652826e0fc5c706695a03cddce372f139eff4d13959da6f1f5d3eabe', '#142E1, St.215, Veal Vong, 7 Makara, Phnom Penh', '(093) 891-393_', 'cambodia', 'ID 020837275', 'default-profile.png', '', '', '', '', 'unavailable');
INSERT INTO "tbstudent" VALUES ('1171', ' Bunramy', 'Ke', 'M', '1992-12-06', 'k.bunramy@yahoo.com', 'fa585d89c851dd338a70dcf535aa2a92fee7836dd6aff1226583e88e0996293f16bc009c652826e0fc5c706695a03cddce372f139eff4d13959da6f1f5d3eabe', '#45E, St. 182, Sangkat Orussey I, Khan 7 Makara, PP', '(010) 595-870_', 'cambodia', 'ID 010700404', 'default-profile.png', '', '', '', '', 'unavailable');
INSERT INTO "tbstudent" VALUES ('1172', ' Phally', 'Phuong', 'M', '1991-02-18', 'phuongphally@gmail.com', 'fa585d89c851dd338a70dcf535aa2a92fee7836dd6aff1226583e88e0996293f16bc009c652826e0fc5c706695a03cddce372f139eff4d13959da6f1f5d3eabe', 'Phnom Penh', '(093) 532-371_', 'cambodia', 'ID 030563981', 'default-profile.png', '', '', '', '', 'unavailable');
INSERT INTO "tbstudent" VALUES ('1173', ' Muny', 'Vaing', 'M', '1993-09-16', 'vaingmuny@gmail.com', 'fa585d89c851dd338a70dcf535aa2a92fee7836dd6aff1226583e88e0996293f16bc009c652826e0fc5c706695a03cddce372f139eff4d13959da6f1f5d3eabe', '#22B, St. 348, Beongkenkong III, Chamkamorn, Phnom Penh', '(093) 781-417_', 'cambodia', 'ID 010733942', 'default-profile.png', '', '', '', '', 'unavailable');
INSERT INTO "tbstudent" VALUES ('1174', ' Menghok', 'Heak', 'M', '1993-01-06', 'menghok.heak@gmail.com', 'fa585d89c851dd338a70dcf535aa2a92fee7836dd6aff1226583e88e0996293f16bc009c652826e0fc5c706695a03cddce372f139eff4d13959da6f1f5d3eabe', '#19Eo, St. 118, Phsar Thmey 1, Daun Penh, Phnom Penh', '(099) 768-481_', 'cambodia', 'ID 010736733', 'default-profile.png', '', '', '', '', 'unavailable');
INSERT INTO "tbstudent" VALUES ('1175', 'Socheat', 'Chea ', 'M', '1994-04-15', 'cheacheat.kh@gmail.com', 'fa585d89c851dd338a70dcf535aa2a92fee7836dd6aff1226583e88e0996293f16bc009c652826e0fc5c706695a03cddce372f139eff4d13959da6f1f5d3eabe', '#58A, St. 6A, Teuk Thla, Sen Sok, Phnom Penh', '(097) 972-6956', 'cambodia', 'ID 090481107', 'default-profile.png', '', '', '', '', 'unavailable');
INSERT INTO "tbstudent" VALUES ('1176', 'Vichhai', 'Kan ', 'M', '1993-01-07', 'kanvichhai@gmail.com', 'fa585d89c851dd338a70dcf535aa2a92fee7836dd6aff1226583e88e0996293f16bc009c652826e0fc5c706695a03cddce372f139eff4d13959da6f1f5d3eabe', '#13A, Songkat Russey Keo, Khan Ressey Keo, Phnom Penh', '(012) 810-823_', 'cambodia', 'ID 010718272', 'default-profile.png', '', '', '', '', 'unavailable');
INSERT INTO "tbstudent" VALUES ('1177', 'Arun ', 'Lam ', 'M', '1991-08-02', 'arunlam2891@gmail.com', 'fa585d89c851dd338a70dcf535aa2a92fee7836dd6aff1226583e88e0996293f16bc009c652826e0fc5c706695a03cddce372f139eff4d13959da6f1f5d3eabe', '#134E3, St. 130, Phsar Kandal 2, Khan Daun Penh', '(010) 315-679_', 'cambodia', 'ID 040274421', 'default-profile.png', '', '', '', '', 'unavailable');
INSERT INTO "tbstudent" VALUES ('1178', ' Syla', 'Cha', 'M', '1991-04-11', 'cha.syla1991@gmail.com', 'fa585d89c851dd338a70dcf535aa2a92fee7836dd6aff1226583e88e0996293f16bc009c652826e0fc5c706695a03cddce372f139eff4d13959da6f1f5d3eabe', 'St. 256, Sangkat Teok Laork I, Khan Tuol Kork, Phnom Penh', '(015) 419-283_', 'cambodia', 'ID 140071776', 'default-profile.png', '', '', '', '', 'unavailable');
INSERT INTO "tbstudent" VALUES ('1179', ' Vannara', 'Ung', 'M', '1992-03-25', 'ungvannara@gmail.com', 'fa585d89c851dd338a70dcf535aa2a92fee7836dd6aff1226583e88e0996293f16bc009c652826e0fc5c706695a03cddce372f139eff4d13959da6f1f5d3eabe', 'St. 271, Sangkat Teak Tlar, Khan Sen Sok, Phnom Penh', '(081) 700-987_', 'cambodia', 'ID 070213488', 'default-profile.png', '', '', '', '', 'unavailable');
INSERT INTO "tbstudent" VALUES ('1180', ' Vantha', 'Ken', 'M', '1990-11-10', 'vantha_ken@yahoo.com', 'fa585d89c851dd338a70dcf535aa2a92fee7836dd6aff1226583e88e0996293f16bc009c652826e0fc5c706695a03cddce372f139eff4d13959da6f1f5d3eabe', '#15E3, St. 109, Veang Vong Commune, 7 Makara District, PP', '(098) 257-995_', 'cambodia', 'ID 100546419', 'default-profile.png', '', '', '', '', 'unavailable');
INSERT INTO "tbstudent" VALUES ('1181', 'Ea Hang', 'Khov ', 'M', '1994-05-06', 'Khov.eahang@gmail.com', 'fa585d89c851dd338a70dcf535aa2a92fee7836dd6aff1226583e88e0996293f16bc009c652826e0fc5c706695a03cddce372f139eff4d13959da6f1f5d3eabe', 'Sangkat Toul Sangke, Khan Toul Kork, Phnom Penh', '(077) 367-480_', 'cambodia', 'ID 160290176', 'default-profile.png', '', '', '', '', 'unavailable');
INSERT INTO "tbstudent" VALUES ('1182', 'Channvichea', 'Kheng ', 'M', '1993-04-20', 'vichea@rocketmail.com', 'fa585d89c851dd338a70dcf535aa2a92fee7836dd6aff1226583e88e0996293f16bc009c652826e0fc5c706695a03cddce372f139eff4d13959da6f1f5d3eabe', '#73CEO, St. 122, Sangkat Phsar Deu 3, Khan Toul Kork, PP', '(017) 778-916_', 'cambodia', 'ID 010737358', 'default-profile.png', '', '', '', '', 'unavailable');
INSERT INTO "tbstudent" VALUES ('1183', ' Daneth ', 'Horn', 'M', '1993-02-19', 'horndaneth3@gmail.com', 'fa585d89c851dd338a70dcf535aa2a92fee7836dd6aff1226583e88e0996293f16bc009c652826e0fc5c706695a03cddce372f139eff4d13959da6f1f5d3eabe', 'Bangkok II, Toul Kork District, Phnom Penh', '(070) 725-748_', 'cambodia', 'ID 061205703', 'default-profile.png', '', '', '', '', 'unavailable');
INSERT INTO "tbstudent" VALUES ('1184', ' Doeun ', 'Choeun', 'M', '1989-03-04', 'choeurndoeurn@gmail.com', 'fa585d89c851dd338a70dcf535aa2a92fee7836dd6aff1226583e88e0996293f16bc009c652826e0fc5c706695a03cddce372f139eff4d13959da6f1f5d3eabe', '#127, St. 1, Khan Mean Chey, PP', '(093) 572-442_', 'cambodia', 'ID 050734942', 'default-profile.png', '', '', '', '', 'unavailable');
INSERT INTO "tbstudent" VALUES ('1185', 'Saksonita', 'Khoeurn ', 'F', '1992-08-08', 'saksonita@gmail.com', 'fa585d89c851dd338a70dcf535aa2a92fee7836dd6aff1226583e88e0996293f16bc009c652826e0fc5c706695a03cddce372f139eff4d13959da6f1f5d3eabe', 'Phnom Penh', '(974) 015-374_', 'cambodia', 'ID 021008347', 'default-profile.png', '', '', '', '', 'unavailable');
INSERT INTO "tbstudent" VALUES ('1186', 'Bunrong', 'Leang ', 'M', '1993-04-05', 'bunrongleang@gmail.com', 'fa585d89c851dd338a70dcf535aa2a92fee7836dd6aff1226583e88e0996293f16bc009c652826e0fc5c706695a03cddce372f139eff4d13959da6f1f5d3eabe', 'Sangkat Vel Vong , Khan 7 Makara, Phnom Penh', '(017) 220-707_', 'cambodia', 'ID 061160842', 'default-profile.png', '', '', '', '', 'unavailable');
INSERT INTO "tbstudent" VALUES ('1187', ' Sreynav', 'Huon', 'F', '1993-02-06', 'sreyav9@gmail.com', 'fa585d89c851dd338a70dcf535aa2a92fee7836dd6aff1226583e88e0996293f16bc009c652826e0fc5c706695a03cddce372f139eff4d13959da6f1f5d3eabe', '#75DE4, St. 217, Ourussey III, 7 Makara, Phnom Phnom Penh', '(092) 290-272_', 'cambodia', 'ID 170700444', 'default-profile.png', '', '', '', '', 'unavailable');
INSERT INTO "tbstudent" VALUES ('1188', ' Udam', 'Chheng', 'F', '1990-10-13', 'udamchheng@gmail.com', 'fa585d89c851dd338a70dcf535aa2a92fee7836dd6aff1226583e88e0996293f16bc009c652826e0fc5c706695a03cddce372f139eff4d13959da6f1f5d3eabe', '#41AE1, St. 330, Sangkat Beung Keng Kang III, Khan Chamkarmon, PP', '(070) 871-244_', 'cambodia', 'ID 010642588', 'default-profile.png', '', '', '', '', 'unavailable');
INSERT INTO "tbstudent" VALUES ('1189', 'Sodeth', 'Buoy ', 'M', '1993-07-13', 'sodethbuoy@gmail.com', 'fa585d89c851dd338a70dcf535aa2a92fee7836dd6aff1226583e88e0996293f16bc009c652826e0fc5c706695a03cddce372f139eff4d13959da6f1f5d3eabe', 'St. 157, No 1019, Rouge Chak Village, Phnom Penh', '(010) 553-366_', 'cambodia', 'ID 010740071', 'default-profile.png', '', '', '', '', 'unavailable');
INSERT INTO "tbstudent" VALUES ('1190', ' Raksmeypanha', 'Ang', 'M', '1993-02-05', 'angpanha@yahoo.com', 'fa585d89c851dd338a70dcf535aa2a92fee7836dd6aff1226583e88e0996293f16bc009c652826e0fc5c706695a03cddce372f139eff4d13959da6f1f5d3eabe', '#398EO, Sangkat Beoung Salang, Khan Toul Kork, Phnom Penh', '(069) 852-918_', 'cambodia', 'ID 130098766', 'default-profile.png', '', '', '', '', 'unavailable');
INSERT INTO "tbstudent" VALUES ('1191', 'Sokheng', 'Lim ', 'F', '1993-06-13', 'lim.sokheng1@gmail.com', 'fa585d89c851dd338a70dcf535aa2a92fee7836dd6aff1226583e88e0996293f16bc009c652826e0fc5c706695a03cddce372f139eff4d13959da6f1f5d3eabe', '#73, Sangkat Teak Laork III, Khan Toul Kork, Phnom Penh', '(093) 693-648_', 'cambodia', 'ID 061152504', 'default-profile.png', '', '', '', '', 'unavailable');
INSERT INTO "tbstudent" VALUES ('1192', ' Sophannary', 'Rous', 'F', '1992-11-20', 'sophannaryrous@yahoo.com', 'fa585d89c851dd338a70dcf535aa2a92fee7836dd6aff1226583e88e0996293f16bc009c652826e0fc5c706695a03cddce372f139eff4d13959da6f1f5d3eabe', 'Bakheng Village, Phnom Penh', '(069) 694-302_', 'cambodia', 'ID 010754762', 'default-profile.png', '', '', '', '', 'unavailable');
INSERT INTO "tbstudent" VALUES ('1193', 'Chhaihong', 'Srun ', 'M', '1990-06-12', 'chhaihongsrun@gmail.com', 'fa585d89c851dd338a70dcf535aa2a92fee7836dd6aff1226583e88e0996293f16bc009c652826e0fc5c706695a03cddce372f139eff4d13959da6f1f5d3eabe', '#520, St. 99, Steoung Meanchey, PP', '(012) 549-857_', 'cambodia', 'ID 061142787', 'default-profile.png', '', '', '', '', 'unavailable');
COMMIT;

-- ----------------------------
-- Table structure for tbstudentenroll
-- ----------------------------
-- drop TABLE IF EXISTS "tbstudentenroll";
CREATE TABLE "tbstudentenroll" (
"stu_id" int4 DEFAULT nextval('seq_studentenroll'::regclass) NOT NULL,
"class_id" int4 NOT NULL,
"description" text COLLATE "default",
"stu_enroll" int4 DEFAULT nextval('seq_tbstudentenroll'::regclass) NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of tbstudentenroll
-- ----------------------------
BEGIN;
INSERT INTO "tbstudentenroll" VALUES ('1023', '1025', null, '1080');
INSERT INTO "tbstudentenroll" VALUES ('1022', '1025', null, '1081');
INSERT INTO "tbstudentenroll" VALUES ('1024', '1025', null, '1082');
INSERT INTO "tbstudentenroll" VALUES ('1026', '1025', null, '1083');
INSERT INTO "tbstudentenroll" VALUES ('1027', '1025', null, '1084');
INSERT INTO "tbstudentenroll" VALUES ('1028', '1025', null, '1085');
INSERT INTO "tbstudentenroll" VALUES ('1029', '1025', null, '1086');
INSERT INTO "tbstudentenroll" VALUES ('1030', '1025', null, '1087');
INSERT INTO "tbstudentenroll" VALUES ('1031', '1025', null, '1088');
INSERT INTO "tbstudentenroll" VALUES ('1032', '1025', null, '1089');
INSERT INTO "tbstudentenroll" VALUES ('1033', '1025', null, '1090');
INSERT INTO "tbstudentenroll" VALUES ('1034', '1025', null, '1091');
INSERT INTO "tbstudentenroll" VALUES ('1035', '1025', null, '1092');
INSERT INTO "tbstudentenroll" VALUES ('1018', '1025', null, '1093');
INSERT INTO "tbstudentenroll" VALUES ('1019', '1025', null, '1094');
INSERT INTO "tbstudentenroll" VALUES ('1020', '1025', null, '1095');
INSERT INTO "tbstudentenroll" VALUES ('1036', '1025', null, '1096');
INSERT INTO "tbstudentenroll" VALUES ('1037', '1025', null, '1097');
INSERT INTO "tbstudentenroll" VALUES ('1038', '1025', null, '1098');
INSERT INTO "tbstudentenroll" VALUES ('1039', '1025', null, '1099');
INSERT INTO "tbstudentenroll" VALUES ('1040', '1025', null, '1100');
INSERT INTO "tbstudentenroll" VALUES ('1041', '1025', null, '1101');
INSERT INTO "tbstudentenroll" VALUES ('1042', '1025', null, '1102');
INSERT INTO "tbstudentenroll" VALUES ('1043', '1025', null, '1103');
INSERT INTO "tbstudentenroll" VALUES ('1044', '1025', null, '1104');
INSERT INTO "tbstudentenroll" VALUES ('1045', '1025', null, '1105');
INSERT INTO "tbstudentenroll" VALUES ('1046', '1025', null, '1106');
INSERT INTO "tbstudentenroll" VALUES ('1047', '1025', null, '1107');
INSERT INTO "tbstudentenroll" VALUES ('1048', '1027', null, '1108');
INSERT INTO "tbstudentenroll" VALUES ('1049', '1027', null, '1109');
INSERT INTO "tbstudentenroll" VALUES ('1050', '1027', null, '1110');
INSERT INTO "tbstudentenroll" VALUES ('1051', '1027', null, '1111');
INSERT INTO "tbstudentenroll" VALUES ('1052', '1027', null, '1112');
INSERT INTO "tbstudentenroll" VALUES ('1053', '1027', null, '1113');
INSERT INTO "tbstudentenroll" VALUES ('1054', '1027', null, '1114');
INSERT INTO "tbstudentenroll" VALUES ('1055', '1027', null, '1115');
INSERT INTO "tbstudentenroll" VALUES ('1056', '1027', null, '1116');
INSERT INTO "tbstudentenroll" VALUES ('1057', '1027', null, '1117');
INSERT INTO "tbstudentenroll" VALUES ('1058', '1027', null, '1118');
INSERT INTO "tbstudentenroll" VALUES ('1059', '1027', null, '1119');
INSERT INTO "tbstudentenroll" VALUES ('1060', '1027', null, '1120');
INSERT INTO "tbstudentenroll" VALUES ('1061', '1027', null, '1121');
INSERT INTO "tbstudentenroll" VALUES ('1062', '1027', null, '1122');
INSERT INTO "tbstudentenroll" VALUES ('1063', '1027', null, '1123');
INSERT INTO "tbstudentenroll" VALUES ('1064', '1027', null, '1124');
INSERT INTO "tbstudentenroll" VALUES ('1065', '1027', null, '1125');
INSERT INTO "tbstudentenroll" VALUES ('1066', '1027', null, '1126');
INSERT INTO "tbstudentenroll" VALUES ('1067', '1027', null, '1127');
INSERT INTO "tbstudentenroll" VALUES ('1068', '1032', null, '1128');
INSERT INTO "tbstudentenroll" VALUES ('1069', '1032', null, '1129');
INSERT INTO "tbstudentenroll" VALUES ('1070', '1032', null, '1130');
INSERT INTO "tbstudentenroll" VALUES ('1071', '1032', null, '1131');
INSERT INTO "tbstudentenroll" VALUES ('1072', '1032', null, '1132');
INSERT INTO "tbstudentenroll" VALUES ('1073', '1032', null, '1133');
INSERT INTO "tbstudentenroll" VALUES ('1074', '1032', null, '1134');
INSERT INTO "tbstudentenroll" VALUES ('1075', '1032', null, '1135');
INSERT INTO "tbstudentenroll" VALUES ('1076', '1032', null, '1136');
INSERT INTO "tbstudentenroll" VALUES ('1077', '1032', null, '1137');
INSERT INTO "tbstudentenroll" VALUES ('1078', '1032', null, '1138');
INSERT INTO "tbstudentenroll" VALUES ('1079', '1032', null, '1139');
INSERT INTO "tbstudentenroll" VALUES ('1080', '1032', null, '1140');
INSERT INTO "tbstudentenroll" VALUES ('1081', '1032', null, '1141');
INSERT INTO "tbstudentenroll" VALUES ('1082', '1032', null, '1142');
INSERT INTO "tbstudentenroll" VALUES ('1083', '1032', null, '1143');
INSERT INTO "tbstudentenroll" VALUES ('1084', '1032', null, '1144');
INSERT INTO "tbstudentenroll" VALUES ('1085', '1032', null, '1145');
INSERT INTO "tbstudentenroll" VALUES ('1086', '1032', null, '1146');
INSERT INTO "tbstudentenroll" VALUES ('1087', '1032', null, '1147');
INSERT INTO "tbstudentenroll" VALUES ('1088', '1032', null, '1148');
INSERT INTO "tbstudentenroll" VALUES ('1089', '1032', null, '1149');
INSERT INTO "tbstudentenroll" VALUES ('1090', '1032', null, '1150');
INSERT INTO "tbstudentenroll" VALUES ('1091', '1032', null, '1151');
INSERT INTO "tbstudentenroll" VALUES ('1092', '1032', null, '1152');
INSERT INTO "tbstudentenroll" VALUES ('1093', '1032', null, '1153');
INSERT INTO "tbstudentenroll" VALUES ('1094', '1032', null, '1154');
INSERT INTO "tbstudentenroll" VALUES ('1095', '1032', null, '1155');
INSERT INTO "tbstudentenroll" VALUES ('1096', '1032', null, '1156');
INSERT INTO "tbstudentenroll" VALUES ('1097', '1032', null, '1157');
INSERT INTO "tbstudentenroll" VALUES ('1098', '1032', null, '1158');
INSERT INTO "tbstudentenroll" VALUES ('1099', '1032', null, '1159');
INSERT INTO "tbstudentenroll" VALUES ('1100', '1032', null, '1160');
INSERT INTO "tbstudentenroll" VALUES ('1101', '1032', null, '1161');
INSERT INTO "tbstudentenroll" VALUES ('1102', '1032', null, '1162');
INSERT INTO "tbstudentenroll" VALUES ('1103', '1032', null, '1163');
INSERT INTO "tbstudentenroll" VALUES ('1104', '1032', null, '1164');
INSERT INTO "tbstudentenroll" VALUES ('1106', '1032', null, '1165');
INSERT INTO "tbstudentenroll" VALUES ('1068', '1026', null, '1166');
INSERT INTO "tbstudentenroll" VALUES ('1069', '1026', null, '1167');
INSERT INTO "tbstudentenroll" VALUES ('1070', '1026', null, '1168');
INSERT INTO "tbstudentenroll" VALUES ('1071', '1026', null, '1169');
INSERT INTO "tbstudentenroll" VALUES ('1072', '1026', null, '1170');
INSERT INTO "tbstudentenroll" VALUES ('1073', '1026', null, '1171');
INSERT INTO "tbstudentenroll" VALUES ('1074', '1026', null, '1172');
INSERT INTO "tbstudentenroll" VALUES ('1075', '1026', null, '1173');
INSERT INTO "tbstudentenroll" VALUES ('1076', '1026', null, '1174');
INSERT INTO "tbstudentenroll" VALUES ('1077', '1026', null, '1175');
INSERT INTO "tbstudentenroll" VALUES ('1078', '1026', null, '1176');
INSERT INTO "tbstudentenroll" VALUES ('1079', '1026', null, '1177');
INSERT INTO "tbstudentenroll" VALUES ('1080', '1026', null, '1178');
INSERT INTO "tbstudentenroll" VALUES ('1081', '1026', null, '1179');
INSERT INTO "tbstudentenroll" VALUES ('1082', '1026', null, '1180');
INSERT INTO "tbstudentenroll" VALUES ('1083', '1026', null, '1181');
INSERT INTO "tbstudentenroll" VALUES ('1084', '1026', null, '1182');
INSERT INTO "tbstudentenroll" VALUES ('1085', '1026', null, '1183');
INSERT INTO "tbstudentenroll" VALUES ('1086', '1026', null, '1184');
INSERT INTO "tbstudentenroll" VALUES ('1087', '1026', null, '1185');
INSERT INTO "tbstudentenroll" VALUES ('1088', '1026', null, '1186');
INSERT INTO "tbstudentenroll" VALUES ('1089', '1026', null, '1187');
INSERT INTO "tbstudentenroll" VALUES ('1090', '1026', null, '1188');
INSERT INTO "tbstudentenroll" VALUES ('1091', '1026', null, '1189');
INSERT INTO "tbstudentenroll" VALUES ('1092', '1026', null, '1190');
INSERT INTO "tbstudentenroll" VALUES ('1093', '1026', null, '1191');
INSERT INTO "tbstudentenroll" VALUES ('1094', '1026', null, '1192');
INSERT INTO "tbstudentenroll" VALUES ('1095', '1026', null, '1193');
INSERT INTO "tbstudentenroll" VALUES ('1096', '1026', null, '1194');
INSERT INTO "tbstudentenroll" VALUES ('1097', '1026', null, '1195');
INSERT INTO "tbstudentenroll" VALUES ('1098', '1026', null, '1196');
INSERT INTO "tbstudentenroll" VALUES ('1099', '1026', null, '1197');
INSERT INTO "tbstudentenroll" VALUES ('1100', '1026', null, '1198');
INSERT INTO "tbstudentenroll" VALUES ('1101', '1026', null, '1199');
INSERT INTO "tbstudentenroll" VALUES ('1102', '1026', null, '1200');
INSERT INTO "tbstudentenroll" VALUES ('1103', '1026', null, '1201');
INSERT INTO "tbstudentenroll" VALUES ('1104', '1026', null, '1202');
INSERT INTO "tbstudentenroll" VALUES ('1105', '1026', null, '1203');
INSERT INTO "tbstudentenroll" VALUES ('1106', '1026', null, '1204');
INSERT INTO "tbstudentenroll" VALUES ('1107', '1030', null, '1205');
INSERT INTO "tbstudentenroll" VALUES ('1111', '1030', null, '1206');
INSERT INTO "tbstudentenroll" VALUES ('1115', '1030', null, '1207');
INSERT INTO "tbstudentenroll" VALUES ('1119', '1030', null, '1208');
INSERT INTO "tbstudentenroll" VALUES ('1123', '1030', null, '1209');
INSERT INTO "tbstudentenroll" VALUES ('1127', '1030', null, '1210');
INSERT INTO "tbstudentenroll" VALUES ('1131', '1030', null, '1211');
INSERT INTO "tbstudentenroll" VALUES ('1135', '1030', null, '1212');
INSERT INTO "tbstudentenroll" VALUES ('1139', '1030', null, '1213');
INSERT INTO "tbstudentenroll" VALUES ('1143', '1030', null, '1214');
INSERT INTO "tbstudentenroll" VALUES ('1147', '1030', null, '1215');
INSERT INTO "tbstudentenroll" VALUES ('1150', '1030', null, '1216');
INSERT INTO "tbstudentenroll" VALUES ('1154', '1030', null, '1217');
INSERT INTO "tbstudentenroll" VALUES ('1157', '1030', null, '1218');
INSERT INTO "tbstudentenroll" VALUES ('1160', '1030', null, '1219');
INSERT INTO "tbstudentenroll" VALUES ('1162', '1030', null, '1220');
INSERT INTO "tbstudentenroll" VALUES ('1164', '1030', null, '1221');
INSERT INTO "tbstudentenroll" VALUES ('1108', '1030', null, '1222');
INSERT INTO "tbstudentenroll" VALUES ('1112', '1030', null, '1223');
INSERT INTO "tbstudentenroll" VALUES ('1116', '1030', null, '1224');
INSERT INTO "tbstudentenroll" VALUES ('1120', '1030', null, '1225');
INSERT INTO "tbstudentenroll" VALUES ('1124', '1030', null, '1226');
INSERT INTO "tbstudentenroll" VALUES ('1128', '1030', null, '1227');
INSERT INTO "tbstudentenroll" VALUES ('1132', '1030', null, '1228');
INSERT INTO "tbstudentenroll" VALUES ('1136', '1030', null, '1229');
INSERT INTO "tbstudentenroll" VALUES ('1140', '1030', null, '1230');
INSERT INTO "tbstudentenroll" VALUES ('1144', '1030', null, '1231');
INSERT INTO "tbstudentenroll" VALUES ('1151', '1030', null, '1232');
INSERT INTO "tbstudentenroll" VALUES ('1109', '1030', null, '1233');
INSERT INTO "tbstudentenroll" VALUES ('1113', '1030', null, '1234');
INSERT INTO "tbstudentenroll" VALUES ('1117', '1030', null, '1235');
INSERT INTO "tbstudentenroll" VALUES ('1121', '1030', null, '1236');
INSERT INTO "tbstudentenroll" VALUES ('1125', '1030', null, '1237');
INSERT INTO "tbstudentenroll" VALUES ('1129', '1030', null, '1238');
INSERT INTO "tbstudentenroll" VALUES ('1133', '1030', null, '1239');
INSERT INTO "tbstudentenroll" VALUES ('1137', '1030', null, '1240');
INSERT INTO "tbstudentenroll" VALUES ('1141', '1030', null, '1241');
INSERT INTO "tbstudentenroll" VALUES ('1145', '1030', null, '1242');
INSERT INTO "tbstudentenroll" VALUES ('1148', '1030', null, '1243');
INSERT INTO "tbstudentenroll" VALUES ('1152', '1030', null, '1244');
INSERT INTO "tbstudentenroll" VALUES ('1155', '1030', null, '1245');
INSERT INTO "tbstudentenroll" VALUES ('1158', '1030', null, '1246');
INSERT INTO "tbstudentenroll" VALUES ('1161', '1030', null, '1247');
INSERT INTO "tbstudentenroll" VALUES ('1163', '1030', null, '1248');
INSERT INTO "tbstudentenroll" VALUES ('1165', '1030', null, '1249');
INSERT INTO "tbstudentenroll" VALUES ('1110', '1030', null, '1250');
INSERT INTO "tbstudentenroll" VALUES ('1114', '1030', null, '1251');
INSERT INTO "tbstudentenroll" VALUES ('1118', '1030', null, '1252');
INSERT INTO "tbstudentenroll" VALUES ('1122', '1030', null, '1253');
INSERT INTO "tbstudentenroll" VALUES ('1126', '1030', null, '1254');
INSERT INTO "tbstudentenroll" VALUES ('1130', '1030', null, '1255');
INSERT INTO "tbstudentenroll" VALUES ('1134', '1030', null, '1256');
INSERT INTO "tbstudentenroll" VALUES ('1138', '1030', null, '1257');
INSERT INTO "tbstudentenroll" VALUES ('1142', '1030', null, '1258');
INSERT INTO "tbstudentenroll" VALUES ('1146', '1030', null, '1259');
INSERT INTO "tbstudentenroll" VALUES ('1149', '1030', null, '1260');
INSERT INTO "tbstudentenroll" VALUES ('1153', '1030', null, '1261');
INSERT INTO "tbstudentenroll" VALUES ('1156', '1030', null, '1262');
INSERT INTO "tbstudentenroll" VALUES ('1159', '1030', null, '1263');
INSERT INTO "tbstudentenroll" VALUES ('1166', '1030', null, '1264');
INSERT INTO "tbstudentenroll" VALUES ('1168', '1031', null, '1265');
INSERT INTO "tbstudentenroll" VALUES ('1169', '1031', null, '1266');
INSERT INTO "tbstudentenroll" VALUES ('1167', '1031', null, '1267');
INSERT INTO "tbstudentenroll" VALUES ('1175', '1033', null, '1268');
INSERT INTO "tbstudentenroll" VALUES ('1181', '1033', null, '1269');
INSERT INTO "tbstudentenroll" VALUES ('1187', '1033', null, '1270');
INSERT INTO "tbstudentenroll" VALUES ('1193', '1033', null, '1271');
INSERT INTO "tbstudentenroll" VALUES ('1176', '1033', null, '1272');
INSERT INTO "tbstudentenroll" VALUES ('1182', '1033', null, '1273');
INSERT INTO "tbstudentenroll" VALUES ('1188', '1033', null, '1274');
INSERT INTO "tbstudentenroll" VALUES ('1170', '1033', null, '1275');
INSERT INTO "tbstudentenroll" VALUES ('1177', '1033', null, '1276');
INSERT INTO "tbstudentenroll" VALUES ('1183', '1033', null, '1277');
INSERT INTO "tbstudentenroll" VALUES ('1189', '1033', null, '1278');
INSERT INTO "tbstudentenroll" VALUES ('1171', '1033', null, '1279');
INSERT INTO "tbstudentenroll" VALUES ('1178', '1033', null, '1280');
INSERT INTO "tbstudentenroll" VALUES ('1184', '1033', null, '1281');
INSERT INTO "tbstudentenroll" VALUES ('1190', '1033', null, '1282');
INSERT INTO "tbstudentenroll" VALUES ('1172', '1033', null, '1283');
INSERT INTO "tbstudentenroll" VALUES ('1179', '1033', null, '1284');
INSERT INTO "tbstudentenroll" VALUES ('1185', '1033', null, '1285');
INSERT INTO "tbstudentenroll" VALUES ('1191', '1033', null, '1286');
INSERT INTO "tbstudentenroll" VALUES ('1173', '1033', null, '1287');
INSERT INTO "tbstudentenroll" VALUES ('1174', '1033', null, '1288');
INSERT INTO "tbstudentenroll" VALUES ('1180', '1033', null, '1289');
INSERT INTO "tbstudentenroll" VALUES ('1186', '1033', null, '1290');
INSERT INTO "tbstudentenroll" VALUES ('1192', '1033', null, '1291');
COMMIT;

-- ----------------------------
-- Table structure for tbsubject
-- ----------------------------
-- drop TABLE IF EXISTS "tbsubject";
CREATE TABLE "tbsubject" (
"sub_id" int4 DEFAULT nextval('seq_sub'::regclass) NOT NULL,
"sub_name" text COLLATE "default",
"description" text COLLATE "default",
"active" bool DEFAULT true
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of tbsubject
-- ----------------------------
BEGIN;
INSERT INTO "tbsubject" VALUES ('1004', 'Java', 'J2SE, J2EE, J2ME', 't');
INSERT INTO "tbsubject" VALUES ('1005', 'Web', 'HTML, CSS, JavaScript, jQuery, Ajax, JSON', 't');
INSERT INTO "tbsubject" VALUES ('1006', 'Korean', '서강 1A, 1B', 't');
COMMIT;

-- ----------------------------
-- View structure for dailyattendance
-- ----------------------------
CREATE OR REPLACE VIEW "dailyattendance" AS 
 SELECT stu.first_name,
    stu.last_name,
    att.description,
        CASE att.shift
            WHEN 'am'::text THEN 'Morning'::text
            ELSE 'Afternoon'::text
        END AS shift
   FROM (tbstudent stu
     JOIN tbattendance att ON ((stu.stu_id = att.stu_id)))
  WHERE (att.att_date = to_date(to_char(now(), 'YYYY-MM-DD'::text), 'YYYY-MM-DD'::text));

-- ----------------------------
-- View structure for display_stu_with_score
-- ----------------------------
CREATE OR REPLACE VIEW "display_stu_with_score" AS 
 SELECT tbs.score_id,
    stu.stu_id,
    stu.first_name,
    stu.last_name,
    stu.gender,
    tbs.score,
    st.staff_id,
    cl.class_id,
    tbs.score_date,
    tbs.sub_id
   FROM (((((tbstudent stu
     JOIN tbstudentenroll st_en ON ((stu.stu_id = st_en.stu_id)))
     JOIN tbscore tbs ON ((stu.stu_id = tbs.stu_id)))
     JOIN tbclass cl ON ((st_en.class_id = cl.class_id)))
     JOIN tbclassenroll cl_en ON ((cl.class_id = cl_en.class_id)))
     JOIN tbstaff st ON ((cl_en.staff_id = st.staff_id)));

-- ----------------------------
-- View structure for score_permission
-- ----------------------------
CREATE OR REPLACE VIEW "score_permission" AS 
 SELECT tbstaff.staff_id,
    tbstaff.first_name,
    tbstaff.last_name,
    tbclass.class_id,
    tbclass.class_name,
    tbsubject.sub_id,
    tbsubject.sub_name,
    tbcourse.cou_id,
    tbcourse.cou_name,
    tbgeneration.gen_id,
    tbgeneration.gen_name
   FROM (((((tbclassenroll
     JOIN tbstaff ON ((tbclassenroll.staff_id = tbstaff.staff_id)))
     JOIN tbclass ON ((tbclassenroll.class_id = tbclass.class_id)))
     JOIN tbsubject ON ((tbclassenroll.sub_id = tbsubject.sub_id)))
     JOIN tbcourse ON ((tbclass.cou_id = tbcourse.cou_id)))
     JOIN tbgeneration ON ((tbcourse.gen_id = tbgeneration.gen_id)))
  WHERE (tbclass.active = true);

-- ----------------------------
-- View structure for sel_stu_no_sc
-- ----------------------------
CREATE OR REPLACE VIEW "sel_stu_no_sc" AS 
 SELECT stu.stu_id,
    stu.first_name,
    stu.last_name,
    stu.gender,
    st.staff_id,
    cl.class_id
   FROM ((((tbstudent stu
     JOIN tbstudentenroll st_en ON ((stu.stu_id = st_en.stu_id)))
     JOIN tbclass cl ON ((st_en.class_id = cl.class_id)))
     JOIN tbclassenroll cl_en ON ((cl.class_id = cl_en.class_id)))
     JOIN tbstaff st ON ((cl_en.staff_id = st.staff_id)));

-- ----------------------------
-- View structure for view_cou_stu
-- ----------------------------
CREATE OR REPLACE VIEW "view_cou_stu" AS 
 SELECT stu.stu_id,
    cou.cou_id,
    cou.cou_name,
    cou.is_finish
   FROM (((tbstudent stu
     JOIN tbstudentenroll en ON ((stu.stu_id = en.stu_id)))
     JOIN tbclass cl ON ((cl.class_id = en.class_id)))
     JOIN tbcourse cou ON ((cou.cou_id = cl.cou_id)));

-- ----------------------------
-- View structure for viewattendance
-- ----------------------------
CREATE OR REPLACE VIEW "viewattendance" AS 
 SELECT tbattendance.att_date AS start,
    concat(tbattendance.att_id, ' ', tbstudent.first_name, ' ', tbstudent.last_name) AS title
   FROM (tbattendance
     JOIN tbstudent ON ((tbattendance.stu_id = tbstudent.stu_id)));

-- ----------------------------
-- View structure for viewattendancebyid
-- ----------------------------
CREATE OR REPLACE VIEW "viewattendancebyid" AS 
 SELECT tbattendance.att_date AS start,
    tbattendance.description AS title,
    tbattendance.stu_id
   FROM (tbattendance
     JOIN tbstudent ON ((tbattendance.stu_id = tbstudent.stu_id)));

-- ----------------------------
-- View structure for viewloadscore
-- ----------------------------
CREATE OR REPLACE VIEW "viewloadscore" AS 
 SELECT tbgeneration.gen_id,
    tbgeneration.gen_name,
    tbcourse.cou_id,
    tbcourse.cou_name,
    tbclass.class_id,
    tbclass.class_name,
    tbsubject.sub_id,
    tbsubject.sub_name
   FROM ((tbgeneration
     JOIN tbcourse ON ((tbcourse.gen_id = tbgeneration.gen_id)))
     JOIN tbclass ON ((tbclass.cou_id = tbcourse.cou_id))),
    tbsubject;

-- ----------------------------
-- View structure for viewscore
-- ----------------------------
CREATE OR REPLACE VIEW "viewscore" AS 
 SELECT gen.gen_id,
    gen.gen_name,
    cou.cou_id,
    cou.cou_name,
    cl.class_id,
    cl.class_name,
    stu.stu_id,
    stu.first_name AS stu_first_name,
    stu.last_name AS stu_last_name,
    stu.gender,
    sub.sub_id,
    sub.sub_name,
    sta.staff_id,
    sta.first_name AS sta_first_name,
    sta.last_name AS sta_last_name,
    sta."position",
    sta.status
   FROM (((((((tbgeneration gen
     JOIN tbcourse cou ON ((gen.gen_id = cou.gen_id)))
     JOIN tbclass cl ON ((cou.cou_id = cl.cou_id)))
     JOIN tbstudentenroll stuen ON ((cl.class_id = stuen.class_id)))
     JOIN tbstudent stu ON ((stu.stu_id = stuen.stu_id)))
     JOIN tbclassenroll clen ON ((clen.class_id = cl.class_id)))
     JOIN tbsubject sub ON ((sub.sub_id = clen.sub_id)))
     JOIN tbstaff sta ON ((sta.staff_id = clen.staff_id)));

-- ----------------------------
-- View structure for viewscorerule
-- ----------------------------
CREATE OR REPLACE VIEW "viewscorerule" AS 
 SELECT tbrule.grade,
    tbrule.rank_lower,
    tbrule.rank_top,
    tbrule.detail_grade,
    tbrule.rule_id,
    tbcourse.cou_id,
    tbcourse.cou_name,
    tbgeneration.gen_id,
    tbgeneration.gen_name
   FROM ((tbrule
     JOIN tbcourse ON ((tbrule.cou_id = tbcourse.cou_id)))
     JOIN tbgeneration ON ((tbcourse.gen_id = tbgeneration.gen_id)));

-- ----------------------------
-- View structure for viewstaffenroll
-- ----------------------------
CREATE OR REPLACE VIEW "viewstaffenroll" AS 
 SELECT en.class_enroll,
    st.staff_id,
    st.first_name,
    st.last_name,
    st.gender,
    sub.sub_id,
    sub.sub_name,
    cl.class_id,
    cl.class_name,
    cou.cou_id,
    cou.cou_name,
    cou.is_finish,
    gen.gen_id,
    gen.gen_name
   FROM (((((tbstaff st
     JOIN tbclassenroll en ON ((st.staff_id = en.staff_id)))
     JOIN tbsubject sub ON ((sub.sub_id = en.sub_id)))
     JOIN tbclass cl ON ((cl.class_id = en.class_id)))
     JOIN tbcourse cou ON ((cl.cou_id = cou.cou_id)))
     JOIN tbgeneration gen ON ((gen.gen_id = cou.gen_id)));

-- ----------------------------
-- View structure for viewstudentenroll
-- ----------------------------
CREATE OR REPLACE VIEW "viewstudentenroll" AS 
 SELECT st.stu_id,
    st.first_name,
    st.last_name,
    en.stu_enroll,
    en.description,
    cl.class_id,
    cl.class_name,
    cou.cou_id,
    cou.cou_name,
    cou.is_finish,
    gen.gen_id,
    gen.gen_name
   FROM ((((tbstudentenroll en
     JOIN tbstudent st ON ((st.stu_id = en.stu_id)))
     JOIN tbclass cl ON ((cl.class_id = en.class_id)))
     JOIN tbcourse cou ON ((cou.cou_id = cl.cou_id)))
     JOIN tbgeneration gen ON ((gen.gen_id = cou.gen_id)));

-- ----------------------------
-- View structure for viewstudentincourse
-- ----------------------------
CREATE OR REPLACE VIEW "viewstudentincourse" AS 
 SELECT st.stu_id,
    st.first_name,
    st.last_name,
    cou.cou_id,
    cou.cou_name
   FROM (((tbstudent st
     JOIN tbstudentenroll en ON ((st.stu_id = en.stu_id)))
     JOIN tbclass cl ON ((cl.class_id = en.class_id)))
     JOIN tbcourse cou ON ((cou.cou_id = cl.cou_id)));

-- ----------------------------
-- Function structure for addatt
-- ----------------------------
CREATE OR REPLACE FUNCTION "addatt"(stuid _int4, attdate date, descrip text, shift text)
  RETURNS "pg_catalog"."void" AS $BODY$ 
BEGIN 
	for i in array_lower(stuid, 1)..array_upper(stuid,1) loop
		insert INTO tbattendance (att_date,description,stu_id,shift) VALUES(attdate,descrip,stuid[i],shift);
	END loop;
END;
$BODY$
  LANGUAGE 'plpgsql' VOLATILE COST 100
;

-- ----------------------------
-- Function structure for addscore
-- ----------------------------
CREATE OR REPLACE FUNCTION "addscore"(_score _numeric, _check_score_date text, _score_date date, _stu_id _int4, _sub_id int4, _class_id int4)
  RETURNS "pg_catalog"."int4" AS $BODY$ 
BEGIN
	
	IF  NOT EXISTS(
				select tbsc.stu_id,tbsc.score_date,tbsub.sub_id,tbcla_en.class_id
					from 
				tbscore tbsc INNER JOIN tbsubject tbsub ON tbsc.sub_id=tbsub.sub_id
					INNER JOIN tbclassenroll tbcla_en ON tbsub.sub_id= tbcla_en.sub_id
						where to_char(tbsc.score_date,'YYYY-MM' ) = _check_score_date and tbsub.sub_id = _sub_id and tbcla_en.class_id=_class_id and tbsc.stu_id= _stu_id[1]
		) THEN
		
		for i in array_lower(_stu_id, 1)..array_upper(_stu_id,1) loop
			insert INTO tbscore (score,score_date,stu_id,sub_id) VALUES(_score[i],_score_date,_stu_id[i],_sub_id);
		END loop;
		RETURN 1;

	END IF;
	RETURN 0;
END;
$BODY$
  LANGUAGE 'plpgsql' VOLATILE COST 100
;

-- ----------------------------
-- Function structure for class_enroll
-- ----------------------------
CREATE OR REPLACE FUNCTION "class_enroll"(_staffid int4, _subid int4, _classid int4)
  RETURNS "pg_catalog"."int4" AS $BODY$
BEGIN
	  INSERT INTO tbclassenroll(staff_id,sub_id,class_id)VALUES(_staffId,_subId,_classId);
	IF FOUND THEN

		UPDATE tbstaff SET status = 'unavailable' where staff_id = _staffId;
		RETURN 1; 	
	END IF;
	RETURN 0; 
END
$BODY$
  LANGUAGE 'plpgsql' VOLATILE COST 100
;

-- ----------------------------
-- Function structure for connectby
-- ----------------------------
CREATE OR REPLACE FUNCTION "connectby"(text, text, text, text, int4)
  RETURNS SETOF "pg_catalog"."record" AS '$libdir/tablefunc', 'connectby_text'
  LANGUAGE 'c' STABLE STRICT  COST 1
 ROWS 1000
;

-- ----------------------------
-- Function structure for connectby
-- ----------------------------
CREATE OR REPLACE FUNCTION "connectby"(text, text, text, text, int4, text)
  RETURNS SETOF "pg_catalog"."record" AS '$libdir/tablefunc', 'connectby_text'
  LANGUAGE 'c' STABLE STRICT  COST 1
 ROWS 1000
;

-- ----------------------------
-- Function structure for connectby
-- ----------------------------
CREATE OR REPLACE FUNCTION "connectby"(text, text, text, text, text, int4)
  RETURNS SETOF "pg_catalog"."record" AS '$libdir/tablefunc', 'connectby_text_serial'
  LANGUAGE 'c' STABLE STRICT  COST 1
 ROWS 1000
;

-- ----------------------------
-- Function structure for connectby
-- ----------------------------
CREATE OR REPLACE FUNCTION "connectby"(text, text, text, text, text, int4, text)
  RETURNS SETOF "pg_catalog"."record" AS '$libdir/tablefunc', 'connectby_text_serial'
  LANGUAGE 'c' STABLE STRICT  COST 1
 ROWS 1000
;

-- ----------------------------
-- Function structure for crosstab
-- ----------------------------
CREATE OR REPLACE FUNCTION "crosstab"(text)
  RETURNS SETOF "pg_catalog"."record" AS '$libdir/tablefunc', 'crosstab'
  LANGUAGE 'c' STABLE STRICT  COST 1
 ROWS 1000
;

-- ----------------------------
-- Function structure for crosstab
-- ----------------------------
CREATE OR REPLACE FUNCTION "crosstab"(text, int4)
  RETURNS SETOF "pg_catalog"."record" AS '$libdir/tablefunc', 'crosstab'
  LANGUAGE 'c' STABLE STRICT  COST 1
 ROWS 1000
;

-- ----------------------------
-- Function structure for crosstab
-- ----------------------------
CREATE OR REPLACE FUNCTION "crosstab"(text, text)
  RETURNS SETOF "pg_catalog"."record" AS '$libdir/tablefunc', 'crosstab_hash'
  LANGUAGE 'c' STABLE STRICT  COST 1
 ROWS 1000
;

-- ----------------------------
-- Function structure for crosstab2
-- ----------------------------
CREATE OR REPLACE FUNCTION "crosstab2"(text)
  RETURNS SETOF "public"."tablefunc_crosstab_2" AS '$libdir/tablefunc', 'crosstab'
  LANGUAGE 'c' STABLE STRICT  COST 1
 ROWS 1000
;

-- ----------------------------
-- Function structure for crosstab3
-- ----------------------------
CREATE OR REPLACE FUNCTION "crosstab3"(text)
  RETURNS SETOF "public"."tablefunc_crosstab_3" AS '$libdir/tablefunc', 'crosstab'
  LANGUAGE 'c' STABLE STRICT  COST 1
 ROWS 1000
;

-- ----------------------------
-- Function structure for crosstab4
-- ----------------------------
CREATE OR REPLACE FUNCTION "crosstab4"(text)
  RETURNS SETOF "public"."tablefunc_crosstab_4" AS '$libdir/tablefunc', 'crosstab'
  LANGUAGE 'c' STABLE STRICT  COST 1
 ROWS 1000
;

-- ----------------------------
-- Function structure for del_classenroll_effstaff
-- ----------------------------
CREATE OR REPLACE FUNCTION "del_classenroll_effstaff"(_class_enroll int4)
  RETURNS "pg_catalog"."void" AS $BODY$
BEGIN	

	UPDATE tbstaff SET status = 'available'
		where staff_id = (select staff_id from tbclassenroll where class_enroll=_class_enroll); 
	IF FOUND THEN
				DELETE from tbclassenroll WHERE class_enroll = _class_enroll;
	END IF ;
	
END; 
$BODY$
  LANGUAGE 'plpgsql' VOLATILE COST 100
;

-- ----------------------------
-- Function structure for del_stu_enrol_effstu
-- ----------------------------
CREATE OR REPLACE FUNCTION "del_stu_enrol_effstu"(_stuenrol int4)
  RETURNS "pg_catalog"."void" AS $BODY$
BEGIN	
		
		UPDATE tbstudent SET status = 'available' 
		where stu_id = (SELECT stu_id FROM tbstudentenroll where stu_enroll=_stuenrol);
	IF FOUND THEN
			DELETE from tbstudentenroll WHERE stu_enroll = _stuenrol;
	END IF ;
	
END;
$BODY$
  LANGUAGE 'plpgsql' VOLATILE COST 100
;

-- ----------------------------
-- Function structure for normal_rand
-- ----------------------------
CREATE OR REPLACE FUNCTION "normal_rand"(int4, float8, float8)
  RETURNS SETOF "pg_catalog"."float8" AS '$libdir/tablefunc', 'normal_rand'
  LANGUAGE 'c' VOLATILE STRICT  COST 1
 ROWS 1000
;

-- ----------------------------
-- Function structure for student_enroll
-- ----------------------------
CREATE OR REPLACE FUNCTION "student_enroll"(stuid _int4, classid int4)
  RETURNS "pg_catalog"."void" AS $BODY$ 
BEGIN 
	for i in array_lower(stuid, 1)..array_upper(stuid,1) loop

		insert INTO tbstudentenroll (stu_id,class_id) VALUES(stuid[i],classId);
		IF FOUND THEN 
				UPDATE tbstudent SET status = 'unavailable' where stu_id = stuid[i];
		END IF;
		
	END loop;

END;
$BODY$
  LANGUAGE 'plpgsql' VOLATILE COST 100
;

-- ----------------------------
-- Function structure for upd_clas_staff
-- ----------------------------
CREATE OR REPLACE FUNCTION "upd_clas_staff"(_class_id int4)
  RETURNS "pg_catalog"."int4" AS $BODY$
BEGIN
	UPDATE tbclass SET active = FALSE WHERE class_id=_class_id;
		
		IF FOUND THEN 
				UPDATE tbstaff SET status = 'available' where staff_id in
				(SELECT staff_id FROM tbclassenroll WHERE class_id=_class_id);
		RETURN 1;
		END IF;
		RETURN 0;
END;
$BODY$
  LANGUAGE 'plpgsql' VOLATILE COST 100
;

-- ----------------------------
-- Function structure for upd_coueff_clas_staff
-- ----------------------------
CREATE OR REPLACE FUNCTION "upd_coueff_clas_staff"(_cou_id int4)
  RETURNS "pg_catalog"."int4" AS $BODY$
BEGIN
	UPDATE tbcourse SET is_finish = TRUE WHERE cou_id=_cou_id;
		
		IF FOUND THEN 
			UPDATE tbclass SET active = FALSE WHERE cou_id=_cou_id;

				IF FOUND THEN
						UPDATE tbstaff SET status = 'available' where status='unavailable';
				END IF;
			RETURN 1;
		END IF;
			RETURN 0;
END;
$BODY$
  LANGUAGE 'plpgsql' VOLATILE COST 100
;

-- ----------------------------
-- Function structure for upd_geneff_cou_clas_staff
-- ----------------------------
CREATE OR REPLACE FUNCTION "upd_geneff_cou_clas_staff"(_gen_id int4)
  RETURNS "pg_catalog"."int4" AS $BODY$
BEGIN
	UPDATE tbgeneration SET is_finish = TRUE WHERE gen_id=_gen_id;

	IF FOUND THEN
			UPDATE tbcourse SET is_finish = TRUE WHERE gen_id=_gen_id;
		
		IF FOUND THEN 
			UPDATE tbclass SET active = FALSE WHERE cou_id in (SELECT cou_id FROM tbcourse WHERE gen_id=_gen_id);

				IF FOUND THEN
						UPDATE tbstaff SET status = 'available' where status='unavailable';
				END IF;
		END IF;
			RETURN 1;
	END IF ;
			RETURN 0;
END;
$BODY$
  LANGUAGE 'plpgsql' VOLATILE COST 100
;

-- ----------------------------
-- Alter Sequences Owned By 
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table tbattendance
-- ----------------------------
ALTER TABLE "tbattendance" ADD PRIMARY KEY ("att_id");

-- ----------------------------
-- Uniques structure for table tbclass
-- ----------------------------
ALTER TABLE "tbclass" ADD UNIQUE ("class_id");

-- ----------------------------
-- Primary Key structure for table tbclass
-- ----------------------------
ALTER TABLE "tbclass" ADD PRIMARY KEY ("class_id");

-- ----------------------------
-- Primary Key structure for table tbclassenroll
-- ----------------------------
ALTER TABLE "tbclassenroll" ADD PRIMARY KEY ("class_enroll");

-- ----------------------------
-- Uniques structure for table tbcourse
-- ----------------------------
ALTER TABLE "tbcourse" ADD UNIQUE ("cou_id");

-- ----------------------------
-- Primary Key structure for table tbcourse
-- ----------------------------
ALTER TABLE "tbcourse" ADD PRIMARY KEY ("cou_id");

-- ----------------------------
-- Uniques structure for table tbgeneration
-- ----------------------------
ALTER TABLE "tbgeneration" ADD UNIQUE ("gen_name");

-- ----------------------------
-- Primary Key structure for table tbgeneration
-- ----------------------------
ALTER TABLE "tbgeneration" ADD PRIMARY KEY ("gen_id");

-- ----------------------------
-- Primary Key structure for table tbrule
-- ----------------------------
ALTER TABLE "tbrule" ADD PRIMARY KEY ("rule_id");

-- ----------------------------
-- Primary Key structure for table tbscore
-- ----------------------------
ALTER TABLE "tbscore" ADD PRIMARY KEY ("score_id");

-- ----------------------------
-- Primary Key structure for table tbstaff
-- ----------------------------
ALTER TABLE "tbstaff" ADD PRIMARY KEY ("staff_id");

-- ----------------------------
-- Primary Key structure for table tbstudent
-- ----------------------------
ALTER TABLE "tbstudent" ADD PRIMARY KEY ("stu_id");

-- ----------------------------
-- Primary Key structure for table tbstudentenroll
-- ----------------------------
ALTER TABLE "tbstudentenroll" ADD PRIMARY KEY ("stu_enroll");

-- ----------------------------
-- Primary Key structure for table tbsubject
-- ----------------------------
ALTER TABLE "tbsubject" ADD PRIMARY KEY ("sub_id");

-- ----------------------------
-- Foreign Key structure for table "tbattendance"
-- ----------------------------
ALTER TABLE "tbattendance" ADD FOREIGN KEY ("stu_id") REFERENCES "tbstudent" ("stu_id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Key structure for table "tbclass"
-- ----------------------------
ALTER TABLE "tbclass" ADD FOREIGN KEY ("cou_id") REFERENCES "tbcourse" ("cou_id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Key structure for table "tbclassenroll"
-- ----------------------------
ALTER TABLE "tbclassenroll" ADD FOREIGN KEY ("sub_id") REFERENCES "tbsubject" ("sub_id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "tbclassenroll" ADD FOREIGN KEY ("staff_id") REFERENCES "tbstaff" ("staff_id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "tbclassenroll" ADD FOREIGN KEY ("class_id") REFERENCES "tbclass" ("class_id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Key structure for table "tbcourse"
-- ----------------------------
ALTER TABLE "tbcourse" ADD FOREIGN KEY ("gen_id") REFERENCES "tbgeneration" ("gen_id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Key structure for table "tbrule"
-- ----------------------------
ALTER TABLE "tbrule" ADD FOREIGN KEY ("cou_id") REFERENCES "tbcourse" ("cou_id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Key structure for table "tbscore"
-- ----------------------------
ALTER TABLE "tbscore" ADD FOREIGN KEY ("sub_id") REFERENCES "tbsubject" ("sub_id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "tbscore" ADD FOREIGN KEY ("stu_id") REFERENCES "tbstudent" ("stu_id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Key structure for table "tbstudentenroll"
-- ----------------------------
ALTER TABLE "tbstudentenroll" ADD FOREIGN KEY ("stu_id") REFERENCES "tbstudent" ("stu_id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "tbstudentenroll" ADD FOREIGN KEY ("class_id") REFERENCES "tbclass" ("class_id") ON DELETE NO ACTION ON UPDATE NO ACTION;
