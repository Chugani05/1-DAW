# *******************************
# VENTAS EN TIENDA DE INFORMÁTICA
# *******************************


def run(sales: list) -> tuple:
    pcs = displays = 0
    for daily_sales in sales:
        daily_pc_sales = daily_sales[0]
        daily_display_sales = daily_sales[1]
        pcs += daily_pc_sales
        displays += daily_display_sales

    # Con desenpaquetado
    pcs = displays = 0
    for daily_sales in sales:
        daily_pc_sales, daily_display_sales = daily_sales
        pcs += daily_pc_sales
        displays += daily_display_sales

    # Con desenpaquetado en el bucle
    pcs = displays = 0
    for daily_pc_sales, daily_display_sales in sales:
        pcs += daily_pc_sales
        displays += daily_display_sales

    return pcs, displays


if __name__ == '__main__':
    run([[4, 5], [1, 3], [3, 2]])
