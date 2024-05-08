import re
import mysql.connector
# Let's define a function that extracts the SQL query based on a given key from the provided SQL content.
def extract_query(method,key):
    """
    Extracts a SQL query based on the given key from the provided SQL content.
    
    :param sql_content: str, the content of the SQL text.
    :param key: str, the key for which to extract the query.
    :return: str, the extracted SQL query or None if not found.
    """
    # Use a regex pattern to extract the SQL query that follows the given key
    sql_file_path = 'query/'+method+'.sql'
    with open(sql_file_path, 'r') as file:
        sql_file_content = file.read()
    pattern = re.compile(rf'{key}\s*\{{\s*([^}}]+)\s*\}}', re.DOTALL)
    match = pattern.search(sql_file_content)
    return match.group(1).strip().replace('DB_NAME','jpk_coffee') if match else None

def prepare_query(query_template, values):
    """ 
    Replace placeholders in a SQL query template with actual values.
    
    :param query_template: SQL query template with placeholders as %s.
    :param values: A tuple of values to replace the placeholders.
    :return: A query string with placeholders replaced by values.
    """
    # Make sure the number of placeholders matches the number of values
    placeholders = query_template.count("%s")
    if placeholders != len(values):
        raise ValueError("The number of placeholders does not match the number of values.")
    temp_val = ["'"+val+"'" if type(val) == str else val for val in values ]
    # Replace the placeholders with the actual values
    # This is NOT safe for real queries, as it does not escape the values,
    # and should only be used for display purposes.
    escaped_values = tuple(map(mysql.connector.conversion.MySQLConverter().escape, temp_val))
    query = query_template % escaped_values

    return query.replace('DB_NAME','jpk_coffee')
