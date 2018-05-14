#the minimum: 
#a menu that allows creation of contact, view all contacts, exit
#when I run this program, I want it to say something like "Welcome to Your Contacts
# "How Can We Help?" and then have the menu options
# the menu should work by just selecting options 1, 2, 3, whatever, and then
# running that particular function 
#at the end of each function, should be a way to get back to the menu or to exit 
# "To return to menu, enter blah, to exit, enter blah" 

@contact_id = 1 
@contact_ids = []
@contact_names = []



#the menu 
def menu 
    puts "Welcome to Your Contacts. How Can We Help You? Please select a number."
    puts "1. Create a New Contact"
    puts "2. View All Contacts"
    puts "3. Edit a contact"
    puts "4. Delete a contact"
    puts "5. Exit"
    print "> "
    selection = $stdin.gets.to_i 
    if selection == 1
        create_contact 
    elsif selection == 2
        view_contacts
    elsif selection == 3
        edit_contact
    elsif selection == 4
        delete_contact
    elsif selection == 5
        puts "Exiting contacts."
        exit  
    else 
        puts "Invalid Selection"
        menu 
    end 
    # after_selection
end 

# def after_selection
#     puts "Would you like to return to Main Menu, Yes or No?"
#     print "> "
#     selection = $stdin.gets.chomp
#     if selection == "Yes" 
#         menu
#     elsif selection == "No"
#         exit  
#     end  
# end 

#create a contact 
def create_contact
    puts "Please enter contact name followed by a comma, followed by their phone number."
# saving the user input to a new variable called "contact" 
    contact = gets
# puts the contact_id variable inside the contact_ids array 
    @contact_ids.push(@contact_id)
# puts whatever the user gave us into contact_names array 
    @contact_names.push(contact)
# adds 1 to the contact_id variable 
    @contact_id = @contact_id + 1 

    puts "Contact added."

    menu 
end 


#view all contacts
def view_contacts
# creates a loop that uses a variable to count through the contact_ids list
# and the contact_names list and prints them. Three dots excludes the last item.
    for x in (0...@contact_ids.count)
        puts "#{@contact_ids[x]} #{@contact_names[x]}" 
    end 
    puts "Would you like to 1) delete 2) edit 3) create a new contact 4) return to Main Menu?"
    view_contacts_choice = gets.strip.to_i 
    case 
        when view_contacts_choice == 1 
            delete_contact
        when view_contacts_choice == 2 
            edit_contact 
        when view_contacts_choice == 3
            create_contact 
        when view_contacts_choice == 4
            menu 
        else 
            puts "Invalid selection." 
            view_contacts 
    end 

end 

#exit
def quit_program  
    exit 
end 


#-----below this line is extra if I have time-------#


# delete a contact. This function needs to pinpoint a specific item in both 
# arrays and then delete it and have the array adjust for the deleted items. 
def delete_contact
    puts "Which contact would you like to delete?"
    for x in (0...@contact_ids.count)
        puts "#{@contact_ids[x]} #{@contact_names[x]}" 
    end 
    delete_choice = gets.to_i 
    puts "You would like to permanently delete #{@contact_ids[delete_choice - 1]}) #{@contact_names[delete_choice - 1]}?"
    puts "Enter 1 to confirm deletion. Enter 2 to make a new selection."
    delete_confirm = gets.to_i 
    case 
        when  delete_confirm = 1
            @contact_ids.delete_at(delete_choice - 1)
            @contact_names.delete_at(delete_choice - 1)
            #so at this point the program succesfully deletes contacts
            #but the id is a set number, not its location in the array + 1
            #so they keep the number initially assigned instead of moving up in the array
            puts "Contact deleted."
            menu 
        when delete_confirm = 2 
            delete_contact 
        else 
            puts "Invalid choice."
            delete_contact 
    end 

end 

# edit a contact 
def edit_contact 
    puts "Which contact would you like to edit?"
    for x in (0...@contact_ids.count)
        puts "#{@contact_ids[x]} #{@contact_names[x]}" 
    end 

end 

menu 

# ability to view deleted contacts? 


# would be amazing if it can alphabetize the names somehow 