import jwt

def encode_payload(payload:dict) -> str:
    """
    encode user payload as a jwt
    :param user:
    :return:
    """
    encoded_data = jwt.encode(payload=payload,key='secret',algorithm="HS256")

    return encoded_data

def decode_payload(token: str) -> dict:
    """
    :param token: jwt token
    :return:
    """
    decoded_data = jwt.decode(jwt=token,key='secret',algorithms=["HS256"])

    return decoded_data