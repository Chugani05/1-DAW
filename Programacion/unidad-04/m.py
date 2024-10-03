class Website():
    def __init__(self, url: str,  header: str, main: str, footer: str):
        self.current_url = url
        self.header = header
        self.main = main
        self.footer = footer
        self.links = {}

    @staticmethod
    def is_valid_id(method): # Recibe un método
        def wrapper(self, *args, **kwargs): # Siempre va un self
            # Vamos a suponer que element_id es el primer parámetro nominal
            element_id = kwargs['element_id'] # Cogemos el evalor de 'element_id' en el diccionario
            if element_id in self.links:
                return method(self, *args, **kwargs) # Si esta en el link lo retornamos
            raise WebsiteError(self.current_url f'Invalid link {element_id}') # si no, se lanza el error
        return wrapper # Devuelve el método

    def add_link(self, url: str, element_id: str) -> None:
        self.links[element_id] = url
    
    # Se convierte este método en un decorador
    #   def is_valid_link(self, element_id: str) -> bool:
    #       return element_id in self.links
    
    @is_valid_id
    def click_link(self, element_id: str):
        self.current_url = self.links[element_id]

    # Todo esto no es necesario con el decorador
    #   def click_link(self, element_id: str):
    #       if self.is_valid_link(element_id):
    #           self.current_url = self.links[element_id]
    #       else:
    #           raise WebsiteError(self.current_url f'Link {element_id} does not exist')

class WebsiteError(Exception):
    BASE_MSG = 'Website Error'

    def __init__(self, url: str, msg: str)-> None:
        if msg:
            self.msg = f'{WebsiteError}: {msg}' 
        else:
            self.msg = WebsiteError.BASE_MSG
        super().__init__(msg)
        self.url = url

    def __str__(self) -> str:
        return f'{self.url} at {self.msg}'
    

    from m import Website
    w = Website()
