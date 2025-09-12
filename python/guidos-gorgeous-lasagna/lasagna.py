"""
Lasagna Cooking Module

This module provides functions to assist in calculating the cooking and preparation 
times for lasagna. It includes the expected baking time, preparation time per layer, 
and functions to determine the remaining baking time and total elapsed time.

Constants:
- EXPECTED_BAKE_TIME: The total expected baking time for the lasagna in minutes.
- preparation_time: The time required to prepare each layer of the lasagna in minutes.

Functions:
- bake_time_remaining(elapsed_bake_time: int) -> int:
    Calculates the remaining baking time based on the elapsed baking time.

- preparation_time_in_minutes(number_of_layers: int) -> int:
    Calculates the total preparation time based on the number of layers in the lasagna.

- elapsed_time_in_minutes(number_of_layers: int, elapsed_bake_time: int) -> int:
    Calculates the total elapsed time, including both preparation and baking time.

Usage:
To use this module, import it and call the functions with the appropriate parameters 
to get the desired cooking times for your lasagna.
"""

from typing import Optional

EXPECTED_BAKE_TIME: int = 40
preparation_time: Optional[int] = 10

def bake_time_remaining(elapsed_bake_time: int) -> int:
    """
    Calculate the bake time remaining.

    :param elapsed_bake_time: int - baking time already elapsed.
    :return: int - remaining bake time (in minutes) derived from 'EXPECTED_BAKE_TIME'.

    Function that takes the actual minutes the lasagna has been in the oven as
    an argument and returns how many minutes the lasagna still needs to bake
    based on the `EXPECTED_BAKE_TIME`.
    """

    return EXPECTED_BAKE_TIME - elapsed_bake_time

def preparation_time_in_minutes(number_of_layers: int) -> int:
    """
    Calculate the preparation time based on the number of layers.

    :param number_of_layers: int - number of layers in the lasagna.
    :return: int - total preparation time in minutes.
    """

    return preparation_time * number_of_layers

def elapsed_time_in_minutes(number_of_layers: int, elapsed_bake_time: int) -> int:
    """
    Calculate the total elapsed time including preparation and baking.

    :param number_of_layers: int - number of layers in the lasagna.
    :param elapsed_bake_time: int - baking time already elapsed.
    :return: int - total elapsed time in minutes.
    """
    
    return preparation_time_in_minutes(number_of_layers) + elapsed_bake_time
