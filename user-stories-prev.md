```
As a person,
So that I can use a bike,
I'd like a docking station to release a bike.

As a person,
So that I can use a good bike,
I'd like to see if a bike is working
```

| Object           | Messages                   |
|:-------------    |:-------------------------- |
| Person           |                            |
| Bike             | working?                   |
| Docking Station  | release_bike               |

```
Bike <-- working? --> true/false
DockingStation <-- release_bike --> a Bike
```

```
As a person I can go to a terminal at a docking station and hire a bike
```

| Object        | Messages                   |
|:------------- |:-------------------------- |
| Person        | Select option to hire bike |
| Terminal      | Display options            |

```
Terminal <-- Display options --> Nil
Person <-- Input option --> Option = Hire
```

```
As I person I can make a payment and get a bike
```

| Object         | Messages                                    |
|:-------------- |:--------------------------------------------|
| Person         | Make a payment                              |
| Bike           | Working?                                    |
| Terminal       | Process the payment.If successful, look for working bike and provide code for it        |
| Docking Station| Free slot true                              |

```
Terminal <-- validate card, request PIN --> true/false
Person <-- insert pin → PIN
Terminal <-- process payment --> true/false
Bike <-- working? --> true/false
Terminal <-- release code --> code
Docking station < -- free slot -- > true
```
