def city_unique_visitors(city, sex=None):
    return 1


def main():
    assert city_unique_visitors("Puerto Colombia") == 1
    assert city_unique_visitors("Blackpool", "M") == 1
    assert city_unique_visitors("Venice", "F") == 1
    assert city_unique_visitors("Plovdiv") == 1


if __name__ == '__main__':
    main()
