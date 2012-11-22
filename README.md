Personal Man Pages is a command line utiltiy for keeping notes about anything and everything. Notes can be tagged and searched easily.
The goal is a sort of virtual sticky note collection that is more manageable than your average pile of sticky notes.

Create a note:

    > pmp add
    Please enter new note's Title:
    Run the washing machine

    Please enter any tags (separated by spaces):
    laundry cleaning chores washing-machine

    Please enter note text (use a double blank line to finish):
    - Fill to agitator line
    - Use one cupful of detergent
    - Use 'regular' cycle


    Note saved
    >

Or, all fill in as much as you want from one line:

    > pmp add --title "Nicole's Phone number" --tags "cell phone phone-number wife Nicole" --message "(123) 456-7890"
    Note saved
    >

Any part not specified will be prompted for:

    > pmp add --title "Home address" --tags "address"
    Please enter note text (use a double blank line to finish):
    1234 Something lane
    A Town NC, 12345


    Note saved
    >
