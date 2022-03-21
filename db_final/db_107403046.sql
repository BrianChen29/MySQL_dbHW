set @num_row = 0;
call db_107403046.sp_BookTicket(8, 3, 1, 4, '2019/12/25', @num_row);
select @num_row;
