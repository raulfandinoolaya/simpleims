# --- Created by Ebean DDL
# To stop Ebean DDL generation, remove this comment and start using Evolutions

# --- !Ups

create table action (
  id                        integer not null,
  startdate                 timestamp,
  agent_username            varchar(255),
  description               varchar(255),
  incident_id               integer,
  constraint pk_action primary key (id))
;

create table agent (
  username                  varchar(255) not null,
  password                  varchar(255),
  fullname                  varchar(255),
  email                     varchar(255),
  constraint pk_agent primary key (username))
;

create table company (
  name                      varchar(255) not null,
  address1                  varchar(255),
  address2                  varchar(255),
  city                      varchar(255),
  state                     varchar(255),
  zipcode                   varchar(255),
  notes                     varchar(255),
  constraint pk_company primary key (name))
;

create table contact (
  email                     varchar(255) not null,
  fullname                  varchar(255),
  phone                     varchar(255),
  company_name              varchar(255),
  constraint pk_contact primary key (email))
;

create table incident (
  id                        integer not null,
  owner_username            varchar(255),
  subject                   varchar(255),
  description               varchar(255),
  startdate                 timestamp,
  enddate                   timestamp,
  priority                  integer,
  status                    varchar(255),
  requester_email           varchar(255),
  constraint pk_incident primary key (id))
;

create sequence action_seq;

create sequence agent_seq;

create sequence company_seq;

create sequence contact_seq;

create sequence incident_seq;

alter table action add constraint fk_action_agent_1 foreign key (agent_username) references agent (username) on delete restrict on update restrict;
create index ix_action_agent_1 on action (agent_username);
alter table action add constraint fk_action_incident_2 foreign key (incident_id) references incident (id) on delete restrict on update restrict;
create index ix_action_incident_2 on action (incident_id);
alter table contact add constraint fk_contact_company_3 foreign key (company_name) references company (name) on delete restrict on update restrict;
create index ix_contact_company_3 on contact (company_name);
alter table incident add constraint fk_incident_owner_4 foreign key (owner_username) references agent (username) on delete restrict on update restrict;
create index ix_incident_owner_4 on incident (owner_username);
alter table incident add constraint fk_incident_requester_5 foreign key (requester_email) references contact (email) on delete restrict on update restrict;
create index ix_incident_requester_5 on incident (requester_email);



# --- !Downs

SET REFERENTIAL_INTEGRITY FALSE;

drop table if exists action;

drop table if exists agent;

drop table if exists company;

drop table if exists contact;

drop table if exists incident;

SET REFERENTIAL_INTEGRITY TRUE;

drop sequence if exists action_seq;

drop sequence if exists agent_seq;

drop sequence if exists company_seq;

drop sequence if exists contact_seq;

drop sequence if exists incident_seq;

