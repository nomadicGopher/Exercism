## Python Conventions for Documenting and Enforcing Types

Python provides several conventions and tools for documenting and enforcing types in your code. These practices help improve code readability, maintainability, and can catch errors early in the development process.

<hr>

### Type Hints

Python 3.5 introduced **type hints**, which allow you to specify the expected data types of function arguments and return values. This is done using the `typing` module.

#### Example:
```python
from typing import List, Dict

def greet(name: str) -> str:
    return f"Hello, {name}!"

def process_data(data: List[Dict[str, int]]) -> None:
    for item in data:
        print(item)
```

### Docstrings

Using **docstrings** is a common convention to document the types of parameters and return values. This is especially useful for functions and classes.

#### Example:
```python
def add(a: int, b: int) -> int:
    """
    Adds two integers.

    Parameters:
    a (int): The first integer.
    b (int): The second integer.

    Returns:
    int: The sum of a and b.
    """
    return a + b
```

### Static Type Checkers

Tools like **mypy** can be used to enforce type checking in your code. You can run mypy on your codebase to catch type errors based on the type hints you've provided.

#### Example Command:
```bash
mypy your_script.py
```

### PEP 484

**PEP 484** introduced type hints to Python and provides guidelines on how to use them effectively. It is a good reference for understanding the conventions and best practices for type annotations.

### Type Checking at Runtime

While Python is dynamically typed, you can enforce type checks at runtime using libraries like **typeguard** or **enforce**. These libraries can raise exceptions if the types do not match the specified annotations.

#### Example with typeguard:
```python
from typeguard import typechecked

@typechecked
def multiply(x: int, y: int) -> int:
    return x * y
```

### Summary Table of Conventions

| Convention          | Description                                                                 | Example Usage                          |
|---------------------|-----------------------------------------------------------------------------|----------------------------------------|
| Type Hints          | Specify expected types for function parameters and return values.          | `def func(x: int) -> str:`            |
| Docstrings          | Document types and purpose of functions/classes.                           | `"""Adds two integers."""`            |
| Static Type Checkers| Tools like mypy to check types without running the code.                   | `mypy your_script.py`                  |
| PEP 484             | Guidelines for using type hints effectively.                               | Refer to PEP 484 for best practices.  |
| Runtime Type Checks | Libraries to enforce type checks during execution.                         | `@typechecked` decorator from typeguard.|

By following these conventions, you can enhance the clarity and reliability of your Python code, making it easier for others (and yourself) to understand and maintain.