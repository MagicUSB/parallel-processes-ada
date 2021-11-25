with Ada.Numerics.Elementary_Functions; use Ada.Numerics.Elementary_Functions;
package function_pack is

   Max_Width   : constant := 300_000;
   Core_Number : constant := 2;

   type Int_Array is array (1 .. Max_Width) of Integer;

   procedure Init_Array (num_elements : Integer; arr : in out Int_Array);
   function Partial_Sum
     (arr : Int_Array; start_index : Integer; end_index : Integer)
      return Long_Long_Integer;
   function Calculate_Step (arr_size : Integer) return Integer;

end function_pack;
