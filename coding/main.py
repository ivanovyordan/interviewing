def city_unique_visitors(city, sex=None):
    return 1


def main():
    assert city_unique_visitors('Puerto Colombia') == 97
    assert city_unique_visitors('Blackpool', 'M') == 66
    assert city_unique_visitors('Venice', 'F') == 50
    assert city_unique_visitors('Plovdiv') == 1

    print('OK')


if __name__ == '__main__':
    main()
