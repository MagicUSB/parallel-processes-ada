with Ada.Text_IO, Ada.Integer_Text_IO, Ada.Numerics, function_pack;
use Ada.Text_IO, Ada.Integer_Text_IO, Ada.Numerics, function_pack;

procedure Main is

   task type Part_Sum_Task is
      entry Start_Calc
        (arr : in out Int_Array; start_index : Integer; fin_index : Integer);
      entry Finish_Calc (result_sum : out Long_Long_Integer);
   end Part_Sum_Task;

   task_pack_size : constant := 20;
   sum            : Long_Long_Integer;
   sum_tmp        : Long_Long_Integer;
   arr            : Int_Array;
   step           : Integer;
   cnt            : Integer;
   task_arr       : array (1 .. task_pack_size) of Part_Sum_Task;
   num_elements   : Integer;

   task body Part_Sum_Task is
      part_sum : Long_Long_Integer;
      start_i  : Integer;
      finish_i : Integer;
      a        : Int_Array;
   begin
      accept Start_Calc
        (arr       : in out Int_Array; start_index : in Integer;
         fin_index : in     Integer)
      do
         start_i  := start_index;
         finish_i := fin_index;
         part_sum := 0;
         a        := arr;
      end Start_Calc;

      part_sum := Partial_Sum (a, start_i, finish_i);

      accept Finish_Calc (result_sum : out Long_Long_Integer) do
         result_sum := part_sum;
      end Finish_Calc;
   end Part_Sum_Task;

begin
   sum := 0;
   Put ("Enter the number of elements: ");
   Get (num_elements);
   Init_Array (num_elements, arr);
   step := Integer'Max (num_elements / task_pack_size, 1);
   cnt  := 1;
   for i in 1 .. task_pack_size loop
      task_arr (i).Start_Calc
        (arr, cnt, Integer'Min (cnt + step, num_elements));
      cnt := cnt + step + 1;
   end loop;
   for i in 1 .. task_pack_size loop
      task_arr (i).Finish_Calc (sum_tmp);
      sum := sum + sum_tmp;
   end loop;
   Put ("Sum: " & sum'Image);
end Main;
