import random
import string

EMPTY = ""

UNEXPLORED = "⬛"
WATER = "🟦"
TOUCHED = "🟧"
SUNKEN = "🟥"


def generate_board(
    size: int = 10,
    ships: tuple[tuple[int, int]] = ((5, 1), (4, 1), (3, 2), (2, 1)),
) -> list[list[str]]:
    board = [[EMPTY for _ in range(size)] for _ in range(size)]
    for ship_size, num_ships in ships:
        placed_ships = 0
        while placed_ships < num_ships:
            ship_id = f"{ship_size}{string.ascii_uppercase[placed_ships]}"
            row, col = random.randint(0, size - 1), random.randint(0, size - 1)
            step = random.choice((-1, 1))
            row_step, col_step = (step, 0) if random.randint(0, 1) else (0, step)
            breadcrumbs = []
            for _ in range(ship_size):
                try:
                    if not (0 <= row < size and 0 <= col < size):
                        raise IndexError()
                    if board[row][col] == EMPTY:
                        board[row][col] = ship_id
                        breadcrumbs.append((row, col))
                    else:
                        raise IndexError()
                    row += row_step
                    col += col_step
                except IndexError:
                    # reset board
                    for bc in breadcrumbs:
                        board[bc[0]][bc[1]] = EMPTY
                    break
            else:
                placed_ships += 1
    return board


def show_board(board: list[list[str]]) -> None:
    for row in board:
        for item in row:
            print(f"[{item:2s}]", end="")
        print()


board = generate_board()

LETTERS = "ABCDEFGHIJ"
TOTAL_SHIPS = 5
game = True
turn = 1
a5_counter = a4_counter = a3_counter = b3_counter = a2_counter = points = 0
a5 = []
a4 = []
a3 = []
b3 = []
a2 = []
warships = ['5A', '4A', '3A', '3B', '2A']
touched_ship = None

game_board = [[UNEXPLORED for _ in range(10)] for _ in range(10)]
while game:
    player_coordinate = input("Enter your coordinates: ")
    if player_coordinate[0].upper() in LETTERS and 1 <= int(player_coordinate[1:]) <= 10:
        coordinate_x = int(LETTERS.index(player_coordinate[0].upper()))
        coordinate_y = int(player_coordinate[1:]) - 1
        if game_board[coordinate_x][coordinate_y] == UNEXPLORED:
            match board[coordinate_x][coordinate_y]:
                case "5A":
                    touched_ship = (coordinate_x, coordinate_y)
                    game_board[coordinate_x][coordinate_y] = TOUCHED
                    a5_counter += 1
                    points += 2 * 5
                    a5.append((coordinate_x, coordinate_y))
                    if a5_counter == 5:
                        for touched_ship in a5:
                            if touched_ship is not None:
                                game_board[touched_ship[0]][touched_ship[1]] = SUNKEN
                        points += 4 * 5
                        warships.remove('5A')
                        TOTAL_SHIPS -= 1
                        print(f"Barco hundido, quedan {TOTAL_SHIPS} barcos")
                case "4A":
                    touched_ship = (coordinate_x, coordinate_y)
                    game_board[coordinate_x][coordinate_y] = TOUCHED
                    a4_counter += 1
                    points += 2 * 4
                    a4.append((coordinate_x, coordinate_y))
                    if a4_counter == 4:
                        for touched_ship in a4:
                            if touched_ship is not None:
                                game_board[touched_ship[0]][touched_ship[1]] = SUNKEN
                        points += 4 * 4
                        warships.remove('4A')
                        TOTAL_SHIPS -= 1
                        print(f"Barco hundido, quedan {TOTAL_SHIPS} barcos")
                case "3A":
                    touched_ship = (coordinate_x, coordinate_y)
                    game_board[coordinate_x][coordinate_y] = TOUCHED
                    a3_counter += 1
                    points += 2 * 3
                    a3.append((coordinate_x, coordinate_y))
                    if a3_counter == 3:
                        for touched_ship in a3:
                            if touched_ship is not None:
                                game_board[touched_ship[0]][touched_ship[1]] = SUNKEN
                        points += 4 * 3
                        warships.remove('3A')
                        TOTAL_SHIPS -= 1
                        print(f"Barco hundido, quedan {TOTAL_SHIPS} barcos")
                case "3B":
                    touched_ship = (coordinate_x, coordinate_y)
                    game_board[coordinate_x][coordinate_y] = TOUCHED
                    b3_counter += 1
                    points += 2 * 3
                    b3.append((coordinate_x, coordinate_y))
                    if b3_counter == 3:
                        for touched_ship in b3:
                            if touched_ship is not None:
                                game_board[touched_ship[0]][touched_ship[1]] = SUNKEN
                        points += 4 * 3
                        warships.remove('3B')
                        TOTAL_SHIPS -= 1
                        print(f"Barco hundido, quedan {TOTAL_SHIPS} barcos")
                case "2A":
                    touched_ship = (coordinate_x, coordinate_y)
                    game_board[coordinate_x][coordinate_y] = TOUCHED
                    a2_counter += 1
                    points += 2 * 2
                    a2.append((coordinate_x, coordinate_y))
                    if a2_counter == 2:
                        for touched_ship in a2:
                            if touched_ship is not None:
                                game_board[touched_ship[0]][touched_ship[1]] = SUNKEN
                        points += 4 * 2
                        warships.remove('2A')
                        TOTAL_SHIPS -= 1
                        print(f"Barco hundido, quedan {TOTAL_SHIPS} barcos")
                case _:
                    game_board[coordinate_x][coordinate_y] = WATER
                    if points > 0:
                        points -= 1
                    else:
                        points = 0
        else:
            print(f"Ya has disparado a la casilla {player_coordinate}")

        print("   1  2  3  4  5  6  7  8  9  10")
        for row in range(10):
            row_string = " ".join(game_board[row])
            print(f"{LETTERS[row]}  {row_string}")

        print(f"Tu puntuación actual es: {points} y llevas {turn} rondas")
        turn += 1

        if TOTAL_SHIPS == 0:
            game = False
    else:
        print("Coordenada inválida. Por favor, ingrese una coordenada válida.")

if TOTAL_SHIPS == 0:
    print(
        f"Enhorabuena, has hundido toda la flota. Tu puntuación final ha sido de {points} puntos, con un total de {turn} turnos."
    )
