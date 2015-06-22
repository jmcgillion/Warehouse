1. what is != and where should you use it?  '!=' is equivalent to "is not equal to ".  It may be used in structure flow.
2. put ! before something, like !user_name  No, do not do this.
3. put ! after something, like words.uniq!  The addition of '!' indicates a bang for certain methods that which mutate the caller.
4. put ? before something  No, do not do this.
5. put ? after something   This may be used for in such cases as when using a ternary operator ...
6. put !! before something, like !!user_name