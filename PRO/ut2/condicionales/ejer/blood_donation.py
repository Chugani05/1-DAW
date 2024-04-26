# **************
# DONANDO SANGRE
# **************


def run(age: int, weight: int, heartbeat: int, platelets: int) -> bool:
    age_condition = 18 < age < 65
    weight_condition = weight > 50
    heartbeat_condition = 50 < heartbeat < 110
    platelets_condition = platelets >= 150000

    if age_condition and weight_condition and heartbeat_condition and platelets_condition:
        suitable_for_donation = True
    else:
        suitable_for_donation = False

    return suitable_for_donation


if __name__ == '__main__':
    run(34, 81, 70, 151000)