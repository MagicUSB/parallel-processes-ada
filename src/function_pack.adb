package body function_pack is

   procedure Init_Array (num_elements : Integer; arr : in out Int_Array) is
   begin
      for i in 1 .. num_elements loop
         arr (i) := i;
      end loop;
   end Init_Array;

   function Partial_Sum
     (arr : Int_Array; start_index : Integer; end_index : Integer)
      return Long_Long_Integer
   is
      sum : Long_Long_Integer;
   begin
      sum := 0;
      for i in start_index .. end_index loop
         sum := sum + Long_Long_Integer (arr (i));
      end loop;
      return sum;
   end Partial_Sum;

end function_pack;
