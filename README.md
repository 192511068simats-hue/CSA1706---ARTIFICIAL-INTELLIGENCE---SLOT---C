# Artificial Intelligence Algorithms — Pseudocode

## Overview

This repository contains pseudocode for ten fundamental Artificial Intelligence (AI) algorithms and problem-solving techniques, covering graph search, heuristic search, game playing, constraint satisfaction, and state-space search.

## List of Algorithms

1. Uniform Cost Search (UCS)
2. Breadth-First Search (BFS)
3. Depth-First Search (DFS)
4. Greedy Best-First Search (GBFS)
5. A* Search Algorithm
6. Minimax Algorithm
7. Alpha-Beta Pruning
8. N-Queens Problem
9. Map Coloring Problem
10. Water Jug Problem

---

## 1. Uniform Cost Search (UCS)

**Aim:** Find the least-cost path from a start node to a goal node.

### Pseudocode

```text
UCS(Graph, Start, Goal)

    Create an empty priority queue
    Insert (0, Start, [Start]) into the queue
    Set BestCost[Start] = 0

    WHILE queue is not empty
        Remove the entry (Cost, Node, Path)
        with the lowest Cost

        IF Cost is greater than BestCost[Node]
            CONTINUE
        END IF

        IF Node = Goal
            PRINT Path
            PRINT Cost
            RETURN
        END IF

        FOR each (Neighbor, Weight) of Node
            NewCost = Cost + Weight

            IF Neighbor is not in BestCost
               OR NewCost < BestCost[Neighbor]

                BestCost[Neighbor] = NewCost
                NewPath = Path followed by Neighbor
                Insert (NewCost, Neighbor, NewPath)
                into the priority queue
            END IF
        END FOR
    END WHILE

    PRINT "Goal not found"

END UCS
```

---

## 2. Breadth-First Search (BFS)

**Aim:** Traverse a graph level by level using a queue.

### Pseudocode

```text
BFS(Graph, Start)

    Create an empty Queue
    Create an empty Visited set

    Add Start to Visited
    ENQUEUE Start into Queue

    WHILE Queue is not empty
        Node = DEQUEUE Queue
        PRINT Node

        FOR each Neighbor of Node
            IF Neighbor is not in Visited
                Add Neighbor to Visited
                ENQUEUE Neighbor into Queue
            END IF
        END FOR
    END WHILE

END BFS
```

---

## 3. Depth-First Search (DFS)

**Aim:** Explore a branch as deeply as possible before backtracking.

### Pseudocode

```text
DFS(Graph, Node, Visited)

    Add Node to Visited
    PRINT Node

    FOR each Neighbor of Node
        IF Neighbor is not in Visited
            DFS(Graph, Neighbor, Visited)
        END IF
    END FOR

END DFS
```

**Initial call:**

```text
DFS(Graph, Start, Empty Visited Set)
```

---

## 4. Greedy Best-First Search (GBFS)

**Aim:** Find a path by expanding the node with the smallest heuristic value.

### Pseudocode

```text
GBFS(Graph, Start, Goal, Heuristic)

    Create an empty priority queue
    Create an empty Visited set

    Insert (Heuristic[Start], Start, [Start])
    into the priority queue

    WHILE priority queue is not empty
        Remove the entry with the lowest heuristic
        (HValue, Node, Path)

        IF Node is in Visited
            CONTINUE
        END IF

        Add Node to Visited

        IF Node = Goal
            PRINT Path
            RETURN
        END IF

        FOR each Neighbor of Node
            IF Neighbor is not in Visited
                NewPath = Path followed by Neighbor

                Insert (Heuristic[Neighbor],
                        Neighbor, NewPath)
                into the priority queue
            END IF
        END FOR
    END WHILE

    PRINT "Goal not found"

END GBFS
```

---

## 5. A* Search Algorithm

**Aim:** Find a least-cost path using actual path cost and a heuristic estimate.

**Evaluation function:**

```text
f(n) = g(n) + h(n)
```

- `g(n)` = Actual cost from the start node to node n.
- `h(n)` = Estimated cost from node n to the goal.
- `f(n)` = Estimated total path cost.

### Pseudocode

```text
A_STAR(Graph, Start, Goal, Heuristic)

    Create an empty priority queue
    Set BestCost[Start] = 0

    Insert (Heuristic[Start], 0, Start, [Start])
    into the priority queue

    WHILE priority queue is not empty
        Remove (FValue, GValue, Node, Path)
        with the lowest FValue

        IF GValue is not equal to BestCost[Node]
            CONTINUE
        END IF

        IF Node = Goal
            PRINT Path
            PRINT GValue
            RETURN
        END IF

        FOR each (Neighbor, Weight) of Node
            NewG = GValue + Weight

            IF Neighbor is not in BestCost
               OR NewG < BestCost[Neighbor]

                BestCost[Neighbor] = NewG
                NewF = NewG + Heuristic[Neighbor]
                NewPath = Path followed by Neighbor

                Insert (NewF, NewG, Neighbor, NewPath)
                into the priority queue
            END IF
        END FOR
    END WHILE

    PRINT "Goal not found"

END A_STAR
```

---

## 6. Minimax Algorithm

**Aim:** Select the best move in a two-player game by assuming both players play optimally.

### Pseudocode

```text
MINIMAX(Node, Depth, IsMaximizing)

    IF Node is a terminal node
       OR Depth = 0
        RETURN EvaluationValue(Node)
    END IF

    IF IsMaximizing = TRUE
        BestValue = Negative Infinity

        FOR each Child of Node
            Value = MINIMAX(Child, Depth - 1, FALSE)
            BestValue = MAX(BestValue, Value)
        END FOR

        RETURN BestValue

    ELSE
        BestValue = Positive Infinity

        FOR each Child of Node
            Value = MINIMAX(Child, Depth - 1, TRUE)
            BestValue = MIN(BestValue, Value)
        END FOR

        RETURN BestValue
    END IF

END MINIMAX
```

---

## 7. Alpha-Beta Pruning

**Aim:** Optimize Minimax by avoiding branches that cannot affect the final decision.

### Pseudocode

```text
ALPHA_BETA(Node, Depth, Alpha, Beta, IsMaximizing)

    IF Node is a terminal node
       OR Depth = 0
        RETURN EvaluationValue(Node)
    END IF

    IF IsMaximizing = TRUE
        BestValue = Negative Infinity

        FOR each Child of Node
            Value = ALPHA_BETA(
                Child, Depth - 1,
                Alpha, Beta, FALSE
            )

            BestValue = MAX(BestValue, Value)
            Alpha = MAX(Alpha, BestValue)

            IF Alpha >= Beta
                BREAK
            END IF
        END FOR

        RETURN BestValue

    ELSE
        BestValue = Positive Infinity

        FOR each Child of Node
            Value = ALPHA_BETA(
                Child, Depth - 1,
                Alpha, Beta, TRUE
            )

            BestValue = MIN(BestValue, Value)
            Beta = MIN(Beta, BestValue)

            IF Beta <= Alpha
                BREAK
            END IF
        END FOR

        RETURN BestValue
    END IF

END ALPHA_BETA
```

**Initial call:**

```text
ALPHA_BETA(Root, MaximumDepth,
           Negative Infinity, Positive Infinity, TRUE)
```

---

## 8. N-Queens Problem

**Aim:** Place N queens on an N × N chessboard so that no two queens attack each other.

### Pseudocode

```text
N_QUEENS(Row, N)

    IF Row = N
        PRINT Board
        RETURN TRUE
    END IF

    FOR Column = 0 TO N - 1
        IF PositionIsSafe(Row, Column)
            Place Queen at (Row, Column)

            IF N_QUEENS(Row + 1, N) = TRUE
                RETURN TRUE
            END IF

            Remove Queen from (Row, Column)
        END IF
    END FOR

    RETURN FALSE

END N_QUEENS
```

### Safety Check

```text
POSITION_IS_SAFE(Row, Column)

    FOR each previously occupied row R
        IF a queen exists in the same column
            RETURN FALSE
        END IF

        IF absolute(Row - R) =
           absolute(Column - QueenColumn[R])
            RETURN FALSE
        END IF
    END FOR

    RETURN TRUE

END POSITION_IS_SAFE
```

**Initial call for the 8-Queens problem:**

```text
N_QUEENS(0, 8)
```

---

## 9. Map Coloring Problem

**Aim:** Color map regions so that no two adjacent regions have the same color.

### Pseudocode

```text
MAP_COLORING(Regions, Colors, Index)

    IF Index = NumberOfRegions
        PRINT ColorAssignment
        RETURN TRUE
    END IF

    Region = Regions[Index]

    FOR each Color in Colors
        IF ColorIsSafe(Region, Color)
            Assign Color to Region

            IF MAP_COLORING(
                Regions, Colors, Index + 1
            ) = TRUE
                RETURN TRUE
            END IF

            Remove Color assignment from Region
        END IF
    END FOR

    RETURN FALSE

END MAP_COLORING
```

### Color Safety Check

```text
COLOR_IS_SAFE(Region, Color)

    FOR each Neighbor of Region
        IF Neighbor has the same Color
            RETURN FALSE
        END IF
    END FOR

    RETURN TRUE

END COLOR_IS_SAFE
```

**Initial call using four colors:**

```text
MAP_COLORING(Regions,
             [Red, Green, Blue, Yellow], 0)
```

---

## 10. Water Jug Problem

**Aim:** Measure exactly 4 litres using a 5-litre jug and a 3-litre jug.

### State Representation

```text
State = (X, Y)

X = Water in the 5-litre jug
Y = Water in the 3-litre jug

Initial State = (0, 0)
Goal Condition = X = 4 OR Y = 4
```

### Pseudocode

```text
WATER_JUG()

    Create an empty Queue
    Create an empty Visited set

    Start = (0, 0)
    ENQUEUE (Start, [Start]) into Queue
    Add Start to Visited

    WHILE Queue is not empty
        (State, Path) = DEQUEUE Queue
        (X, Y) = State

        IF X = 4 OR Y = 4
            PRINT Path
            RETURN
        END IF

        Generate the following possible states:

            Fill 5-litre jug:
                (5, Y)

            Fill 3-litre jug:
                (X, 3)

            Empty 5-litre jug:
                (0, Y)

            Empty 3-litre jug:
                (X, 0)

            Pour from 5-litre jug to 3-litre jug:
                Amount = MIN(X, 3 - Y)
                (X - Amount, Y + Amount)

            Pour from 3-litre jug to 5-litre jug:
                Amount = MIN(Y, 5 - X)
                (X + Amount, Y - Amount)

        FOR each NewState
            IF NewState is not in Visited
                Add NewState to Visited
                NewPath = Path followed by NewState
                ENQUEUE (NewState, NewPath)
            END IF
        END FOR
    END WHILE

    PRINT "Solution not found"

END WATER_JUG
```

---

## Summary

| No. | Algorithm | Main technique |
|---:|---|---|
| 1 | UCS | Priority queue and cumulative path cost |
| 2 | BFS | Queue and level-order traversal |
| 3 | DFS | Recursion and backtracking |
| 4 | GBFS | Heuristic-based priority queue |
| 5 | A* | Actual cost plus heuristic |
| 6 | Minimax | Adversarial game-tree search |
| 7 | Alpha-Beta Pruning | Minimax with branch pruning |
| 8 | N-Queens | Backtracking and constraint checking |
| 9 | Map Coloring | Constraint satisfaction and backtracking |
| 10 | Water Jug | State-space search using BFS |

## Conclusion

These ten algorithms demonstrate fundamental Artificial Intelligence techniques, including uninformed search, informed search, adversarial search, constraint satisfaction, backtracking, and state-space exploration. The pseudocode is language-independent and can be translated into Python or another programming language.
