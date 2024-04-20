import re

# Let's define a function that extracts the SQL query based on a given key from the provided SQL content.
def extract_query_by_key(key):
    """
    Extracts a SQL query based on the given key from the provided SQL content.
    
    :param sql_content: str, the content of the SQL text.
    :param key: str, the key for which to extract the query.
    :return: str, the extracted SQL query or None if not found.
    """
    # Use a regex pattern to extract the SQL query that follows the given key
    sql_file_path = 'query/select.sql'
    with open(sql_file_path, 'r') as file:
        sql_file_content = file.read()
    pattern = re.compile(rf'{key}\s*\{{\s*([^}}]+)\s*\}}', re.DOTALL)
    match = pattern.search(sql_file_content)
    return match.group(1).strip() if match else None