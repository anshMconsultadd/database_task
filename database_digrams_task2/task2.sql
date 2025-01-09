 CREATE DATABASE IF NOT EXISTS facebook ;
 use facebook;
 
 create table user_profile(
    user_id int ,
    user_name varchar(255) PRIMARY key not null,
    name varchar(255),
    age int,
    email varchar (255),
    created_on DATETIME,
    member_since DATETIME
 );

create table post_comment(
    comment_id int PRIMARY key not null,
    text_content varchar(255),
    comment_timestamp DATETIME,
    rect_to_coment varchar(255),
    commented_by varchar(255),
    FOREIGN key (commented_by) REFERENCES user_profile(user_name)
 );

create table user_posts(
    post_id int PRIMARY key not null,
    text_content varchar(255),
    images varchar(255),
    videos varchar(255),
    likes int,
    comments int,
    userprofile varchar(255),
    FOREIGN key(userprofile) REFERENCES user_profile(user_name),
    FOREIGN key (likes) REFERENCES post_like(like_id),
    FOREIGN key (comments) REFERENCES post_comment(comment_id)
 );

create table post_like(
    like_id int PRIMARY key not null,
    liked_by_whom varchar(255),
    like_count int,
    time_stamp_like DATETIME,
    FOREIGN key (liked_by_whom) REFERENCES user_profile(user_name)
 );


create table community_groups(
    group_id int PRIMARY key not null,
    group_chats varchar(255),
    start_year DATETIME
 );

