import os

def dump_environment_variables():
    """
    Reads all environment variables and writes them to a file named 'os.variables'.
    """
    output_filename = "os.variables"
    try:
        with open(output_filename, 'w') as f:
            f.write("--- Environment Variables ---\n")
            for key, value in os.environ.items():
                f.write(f"{key}={value}\n")
            f.write("-----------------------------\n")
        print(f"Environment variables successfully written to '{output_filename}'")
    except IOError as e:
        print(f"Error writing to file '{output_filename}': {e}")

if __name__ == '__main__':
    dump_environment_variables()
