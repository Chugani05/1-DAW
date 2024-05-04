class Plane:
    def __init__(
        self,
        fuel_capacity: float,
        max_passengers: int,
        storage_capacity: float,
        manufacturer: str,
        model: str,
        doors: int,
        reactor: bool = True,
    ):
        self.fuel_capacity = fuel_capacity
        self.max_passengers = max_passengers
        self.storage_capacity = storage_capacity
        self.manufacturer = manufacturer
        self.model = model
        self.door_status = {door: False for door in range(doors)}
        self.reactor = reactor
        self.fuel = 0
        self.height = 0
        self.velocity = 0

    def refuel(self, amount):
        print(f"Refueling {amount} liters of fuel...")
        if self.fuel + amount > self.fuel_capacity:
            print(f"Cannot refuel more than {self.fuel_capacity} liters.")
        else:
            self.fuel += amount
            print("Refueling completed!")

    def board_passengers(self, num_passengers):
        if num_passengers == 0:
            print("No passengers to board.")

        available_seats = self.max_passengers - sum(self.door_status.values())
        if num_passengers <= available_seats:
            print(f"Boarding {num_passengers} passengers onto the plane...")
            for door, status in self.door_status.items():
                if not status:
                    print(f"Opening door {door}...")
                    self.door_status[door] = True
                    print(f"Passenger boarded through door {door}.")
                    num_passengers -= 1
                    if num_passengers == 0:
                        print("All passengers boarded.")
        else:
            print(f"Not enough seats available. Boarding {available_seats} passengers.")

    def close_doors(self):
        open_doors = [door for door, status in self.door_status.items() if not status]
        if open_doors:
            for door in open_doors:
                print(f"Closing door {door}...")
                self.door_status[door] = True
                print(f"Door {door} closed")
        else:
            print("All doors are already closed.")

    def check_status(self):
        status = {
            "fuel_level": self.fuel,
            "height": self.height,
            "velocity": self.velocity,
            "door_status": self.door_status,
        }
        return status

    def take_off(self):
        open_doors = [door for door, status in self.door_status.items() if not status]
        if open_doors:
            print("Error! All doors must be closed.")
            print(f"Open doors: {open_doors}")
        elif self.fuel < 100:
            print("Error! Insufficient fuel level for takeoff.")
            print("Please refuel before takeoff.")
        print("Initiating takeoff procedure...")
        self.height = 50
        self.velocity = 10
        print("The aircraft has successfully taken off!")

    def fly(self, distance):
        fuel_consumption_rate = 0.1
        fuel_needed = distance * fuel_consumption_rate
        if self.fuel < fuel_needed:
            print("Error! Insufficient fuel for this flight distance.")
        self.fuel -= fuel_needed
        print(f"The aircraft has flown {distance} km.")

    def land(self):
        print("Initiating landing procedure...")
        self.height = 0
        self.velocity = 0
        print("The aircraft has successfully landed!")
