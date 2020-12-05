

# Question 1

-   Decrasing in the wafer cost, will also decrase the cost of the chip.

**Today**:  Wafer cost &rarr; 10 000 $

Wafer cost will decrease 20% every year 

**4 years later**:  Wafer cost &rarr; $10000 &times; 0.8<sup>4</sup> = 4096 $

\quad

-   Yiled is the percantage of good dies from the total number of dies on the wafer. Therefore decrasing in the yeild will increase the cost of the chip.

Yield will decrease 10% every year

**4 years later**:  Yield will be &rarr; $\(0.9^4 = 0.6561\)$ of the inital yield, which is: \(0.6561 \times 0.8 = 0.52488\)

\[\mbox{Cost per die} = \frac{\mbox{Cost of wafer}}{\mbox{Dies per wafer} \times \mbox{yield}}\]

\begin{flalign*}
 & \mbox{ Cost per die } = \frac{4096}{120 \times 0.52488} = 65.03\ \$ &
\end{flalign*}

Cost of single chip manifacturing will be 65.03 $ after 4 years.

\newpage


# Question 2


## A)

\[ 
\mbox{ CPU clock cycles } = \sum\limits_{i=1}^{n} ( \mbox{CPI_i} \times \mbox{C_i} )
\]

\[
\mbox{ CPU clock cycles_{compiler A}  } = 10^{6} \times ( (50 \times 2) + (10 \times 4) + (2 \times 3) ) = 146 \times 10^{6}\ cycles 
 \]

\[
\mbox{ CPU clock cycles_{compiler B}  } = 10^{6} \times ( (80 \times 2) + (5 \times 4) + (1 \times 3) ) = 183 \times 10^{6}\ cycles
 \]

Compiler A has the lower clock cycles, so it must be faster. Compiler A \(\frac{183 \times 10^6}{146 \times 10^6} = 1.25\) times faster than compiler B.


## B)

\begin{align*} 
  \mbox{ Execution time } &= \mbox{ number of cycles } \times \mbox{ clock cycle time } & \\
  \mbox{ Clock cycle time } &=  \frac{\mbox{execution time}}{\mbox{number of cycles}} &
\end{align*} 

\begin{flalign*} 
  \mbox{ Clock cycle time } = \frac{100 \times 10^{-3} }{146 \times 10^{6}} &= \frac{100}{146} \times 10^{-9} \ seconds & \\
  \mbox { Clock rate } = \frac{1}{\frac{100}{146} \times 10^{-9}} &= 1.46\  \mbox{GHz}
\end{flalign*} 

