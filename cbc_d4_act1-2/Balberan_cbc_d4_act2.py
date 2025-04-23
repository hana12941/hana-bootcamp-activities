def find_longest_name(names):
    if not names:
        return None
    longest_name = max(names, key=len)
    return longest_name

user_input = input("Enter names separated by commas: ")
names_list = [name.strip() for name in user_input.split(',')]

longest_name = find_longest_name(names_list)
print("The longest name is:",{longest_name})