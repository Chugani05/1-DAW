# ***********************
# SEPARANDO RECURSO SAMBA
# ***********************


def run(smb_path: str) -> tuple:
    host_start = smb_path.find('//') + 2
    host_end = smb_path.find('/', host_start)

    host = smb_path[host_start:host_end]
    path = smb_path[host_end:]

    return host, path


if __name__ == '__main__':
    run('//1.1.1.1/aprende/python')