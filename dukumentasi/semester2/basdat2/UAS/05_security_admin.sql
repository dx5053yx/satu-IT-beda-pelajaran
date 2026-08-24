create user staff_loket identified by "password";
create user penumpang identified by "password";
create role role_staff_loket;
create role role_penumpang;
grant create session to staff_loket;
grant create session to penumpang;
grant role_staff_loket to staff_loket;
grant role_viewer_laporan to penumpang;