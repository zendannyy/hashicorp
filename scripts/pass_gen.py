import random
import argparse
import string
import sys

# Define character sets for password

def gen_pass(length):
    """gebnrates a random password, using the option provided"""
    upper = string.ascii_uppercase
    lower = string.ascii_lowercase
    num = string.digits
    special = string.punctuation
    # whitespace = string.whitespace

    # Combine character sets and shuffle them
    chars = list(lower + upper + num + special)
    random.shuffle(chars)
    chars = ''.join(chars)

    return ''.join(random.choice(chars) for _ in range(length))
    # Get the desired password length from the user


def main():
    
    parser = argparse.ArgumentParser(description="""CLI tool for a password generator. You can 
    give it options for length of password or special characters.""")
    parser.add_argument('-l', '--length', required=True, type=int, default=random.randint(12, 50), help='Specifies the length of the password')
    # parser.add_argument('-s', help='Specifes if using special characters')
    args = parser.parse_args()

    if len(sys.argv) < 2:
        sys.exit("Usage: Run script as follows: pass_gen.py -l 30.\n"
				 	"pass_gen.py -l for full help details")

    # Generate the password and print it
    if args.length < 15 or args.length > 50:
        raise ValueError("Password length must be between 15 and 50: ")

    if args.length:
        password = gen_pass(args.length)
        print(f"Your password is: {password}")


if __name__ == '__main__':
	main()
