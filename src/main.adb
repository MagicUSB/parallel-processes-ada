with Ada.Text_IO, Ada.Integer_Text_IO, Ada.Numerics, function_pack;
use Ada.Text_IO, Ada.Integer_Text_IO, Ada.Numerics, function_pack;

procedure Main is

   num_elements : Integer;
   sum          : Long_Long_Integer;
   arr          : Int_Array;
   step         : Integer;
   cnt          : Integer;

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
