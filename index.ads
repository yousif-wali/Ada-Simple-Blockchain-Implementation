with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Strings.Unbounded.Text_IO; use Ada.Strings.Unbounded.Text_IO;

procedure Simple_Blockchain is

   -- Define a Block
   type Block is record
      Index     : Integer;
      Timestamp : String(1..20);
      Data      : Unbounded_String;
      Prev_Hash : Unbounded_String;
      Hash      : Unbounded_String;
   end record;

   -- Array of Blocks for the Blockchain
   type Blockchain is array (Integer range <>) of Block;
   Chain : Blockchain(1..10);  -- Example with 10 blocks

   -- Function to simulate hashing (placeholder)
   function Compute_Hash (B : Block) return Unbounded_String is
   begin
      -- Placeholder for a real hash function
      return To_Unbounded_String("hash" & B.Index'Img);
   end Compute_Hash;

   -- Procedure to add a new block
   procedure Add_Block (Index : in Integer; Data : in Unbounded_String) is
      Prev_Hash : Unbounded_String;
   begin
      if Index = 1 then
         Prev_Hash := To_Unbounded_String("0");
      else
         Prev_Hash := Chain(Index - 1).Hash;
      end if;

      Chain(Index) := (Index, "2021-01-01", Data, Prev_Hash, Compute_Hash(Block'(Index, "2021-01-01", Data, Prev_Hash, To_Unbounded_String(""))));
   end Add_Block;

begin
   -- Initialize the Blockchain
   for I in Chain'Range loop
      Add_Block(I, To_Unbounded_String("Block Data " & Integer'Image(I)));
   end loop;

   -- Display the Blockchain
   for I in Chain'Range loop
      Put("Block Index: ");
      Put(Chain(I).Index);
      New_Line;
      Put("Block Data: ");
      Put(To_String(Chain(I).Data));
      New_Line;
      Put("Block Hash: ");
      Put(To_String(Chain(I).Hash));
      New_Line(2);
   end loop;

end Simple_Blockchain;
