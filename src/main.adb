with Ada.Text_IO, Ada.Integer_Text_IO, Ada.Numerics, function_pack;
use Ada.Text_IO, Ada.Integer_Text_IO, Ada.Numerics, function_pack;

procedure Main is

   task type Part_Sum_Task is
      entry Start_Calc (start_index : Integer; fin_index : Integer);
      entry Finish_Calc (result_sum : out Long_Long_Integer);
   end Part_Sum_Task;

   num_elements : Integer;
   sum          : Long_Long_Integer;
   arr          : Int_Array;
   step         : Integer;
   cnt          : Integer;
   task_arr     : array (1 .. 20) of Part_Sum_Task;

   task body Part_Sum_Task is
      sum      : Long_Long_Integer := 0;
      start_i  : Integer;
      finish_i : Integer;
   begin
      accept Start_Calc (start_index : in Integer; fin_index : in Integer) do
         start_i  := start_index;
         finish_i := fin_index;
      end Start_Calc;
      sum := Partial_Sum (arr, start_i, finish_i);
      accept Finish_Calc (result_sum : out Long_Long_Integer) do
         result_sum := sum;
         --Put_Line(Long_Long_Integer'Image(result_sum));
      end Finish_Calc;
   end Part_Sum_Task;
begin
   sum := 0;
   Put ("Enter the number of elements: ");
   Get (num_elements);
   Init_Array (num_elements, arr);
   step := Calculate_Step (arr'Length);
   cnt  := 1;
   while cnt <= num_elements loop
      sum :=
        sum + Partial_Sum (arr, cnt, Integer'Min (cnt + step, num_elements));
      cnt := cnt + step + 1;
   end loop;
   Put ("Sum: " & sum'Image);
end Main;
