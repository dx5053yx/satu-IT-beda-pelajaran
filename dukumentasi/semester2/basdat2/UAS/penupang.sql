create role role_penumpang;

begin
    for i in 1..100 loop
        execute immediate 'create user penumpang'||lpad(i,3,'0')||' identified by "password"';
        execute immediate 'grant create session to penumpang'||lpad(i,3,'0');
        execute immediate 'grant role_penumpang to penumpang'||lpad(i,3,'0');
    end loop;
end;
/

--akses penumpangg
grant select on kota to role_penumpang;
grant select on terminal to role_penumpang;
grant select on operator_bus to role_penumpang;
grant select on bus to role_penumpang;
grant select on rute to role_penumpang;
grant select on jadwal_perjalanan to role_penumpang;
grant insert on pemesanan_tiket to role_penumpang;

grant select on v_jadwal_bus_lengkap to role_penumpang;
grant select on v_detail_pemesanan to role_penumpang;
grant select on v_pembayaran_lengkap to role_penumpang;
grant select on v_riwayat_pemesanan_pengguna to role_penumpang;
grant select on v_laporan_pendapatan_operator to role_penumpang;
grant select on v_rute_terlaris to role_penumpang;

--cek role
select grantee,granted_role
from dba_role_privs
where grantee like 'PENUMPANG%'
order by grantee;



--berhasil penumpang
select * from transportasi.jadwal_perjalanan;
select * from transportasi.jadwal_perjalanan;

-- -gagal penumpang
delete from transportasi.bus where id_bus=1;
delete from transportasi.bus where id_bus=1;