-- {"headers": {"Employee": ["id", "salary"]}, "argument": 2, "rows": {"Employee": [[1, 100], [2, 100], [3, 200], [4, 200], [5, 300]]}}
CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
DECLARE M INT;
SET M=N-1;
  RETURN (
      # Write your MySQL query statement below.
      SELECT DISTINCT Salary FROM Employee ORDER BY Salary DESC LIMIT M, 1
  );
END



/**
{"headers": {"Employee": ["id", "salary"]}, "argument": 2, "rows": {"Employee": [[1, 100], [2, 200], [3, 300]]}}
{"headers": {"Employee": ["id", "salary"]}, "argument": 2, "rows": {"Employee": [[1, 100]]}}

{"headers": {"Employee": ["id", "salary"]}, "argument": 2, "rows": {"Employee": [[1, 100], [2, 100]]}}

{"headers": {"Employee": ["id", "salary"]}, "argument": 1, "rows": {"Employee": [[1, 100], [2, 100]]}}

{"headers": {"Employee": ["id", "salary"]}, "argument": 88, "rows": {"Employee": [[12, 761], [6, 1037], [87, 38], [1, 786], [39, 1762], [65, 133], [25, 2529], [96, 403], [8, 4333], [11, 3164], [5, 831], [18, 3579], [66, 4778], [26, 4826], [82, 4957], [63, 1288], [64, 2711], [73, 1842], [2, 2627], [78, 1908], [22, 4667], [77, 199], [69, 576], [32, 2638], [79, 510], [23, 622], [43, 2491], [44, 4435], [28, 4552], [86, 4646], [57, 451], [13, 1852], [62, 2835], [72, 544], [37, 2896], [89, 4699], [71, 220], [46, 2333], [95, 2261], [48, 3210], [17, 398], [20, 57], [74, 176], [54, 4272], [35, 2172], [84, 4686], [42, 2595], [76, 3631], [45, 4022], [68, 3248], [40, 571], [14, 4094], [51, 3272], [97, 2057], [30, 2505], [88, 3805], [55, 4926], [81, 3423], [7, 811], [52, 4664], [33, 1842], [41, 4645], [50, 1490], [24, 3361], [59, 4504], [99, 805], [67, 4561], [61, 4641], [38, 2542], [94, 4361], [15, 1652], [70, 1903], [10, 2109], [49, 1428], [29, 558], [60, 708], [3, 1717], [0, 3162], [75, 1450], [83, 2333], [47, 455], [9, 2360], [56, 1570], [80, 1677], [27, 508], [21, 3994], [85, 2276], [91, 1606], [90, 2269], [58, 1954], [19, 774], [4, 655], [92, 3274], [16, 333], [36, 1744], [53, 2262], [93, 3887], [31, 3521], [34, 1415], [98, 2490]]}}
*/
CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
      declare M int;
      set M=N-1;
  RETURN (
      # Write your MySQL query statement below.
      select salary from (
          select salary, dense_rank() over(order by salary desc) r from employee 
      ) as s where r = n limit 1
  );
END
