package function_pack is

   Max_Width   : constant := 900_000;
   Core_Number : constant := 2;

   type Int_Array is array (1 .. Max_Width) of Integer;

   procedure Init_Array (num_elements : Integer; arr : in out Int_Array);
   function Partial_Sum
     (arr : Int_Array; start_index : Integer; end_index : Integer)
      return Long_Long_Integer;

end function_pack;
