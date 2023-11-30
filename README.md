# 451Project
Stat 451 Project Repository

Question: Does the size of the crowd impact the number of goals scored in a match? This question taps into the synergy between audience energy and on-field performance. Could a packed stadium fuel players to score more goals? Exploring this connection between attendance and goal-scoring adds an intriguing layer to the dynamics of sports, prompting us to ponder the influence of crowd enthusiasm on the outcome of a match.

Dataset: For the data source, I used a Kaggle dataset titled FIFA World Cup. (https://www.kaggle.com/datasets/abecklas/fifa-world-cup?select=WorldCupMatches.csv)

Analysis: After examination of the visualization, an intriguing pattern emerges: lower-scoring games exhibit a marginally higher average attendance compared to their higher-scoring counterparts. This observation is accentuated by the darker hues representing a significantly higher frequency of lower-scoring matches. A noteworthy trend unfolds as the goal count rises—there is a subtle dip in attendance, barring a slight uptick in games featuring seven goals.

The rationale behind this phenomenon may lie in the higher likelihood of lower-scoring matches occurring, leading to a general influx of fans in attendance for such games. It's plausible that the anticipation and suspense associated with these contests draw a larger crowd. This trend prompts us to consider the inherent popularity of lower-scoring matches and their ability to captivate audiences.

Furthermore, it's crucial to contextualize these findings within the broader scope of the dataset, which spans back to the 1930 World Cup. Over this extensive timeline, factors such as stadium capacities and the global appeal of the sport may have undergone significant transformations. The evolving nature of these variables over the years could contribute to the observed fluctuations in attendance, adding a temporal layer to our interpretation.

In essence, the interplay between goal-scoring dynamics, fan attendance, and the evolving landscape of football over time offers a nuanced perspective, reminding us of the multifaceted nature of the sport's cultural and historical context.


Visualization #2

What is the relationship between attendance and total goals scored at a world cup tournament?

The relationship between attendance and total goals scored at a World Cup tournament is evidently positive, as illustrated in the provided visualization. Notably, there is a clear correlation, with larger circles representing an increase in the number of matches played.

This correlation can be attributed to the dynamic interplay between audience size and the intensity of the matches. Larger crowds seem to energize teams, fostering a more competitive spirit and, consequently, a higher goal-scoring frequency. The visual dominance of larger circles as the match count rises underscores the influence of the tournament's duration on this correlation. More matches translate to increased goal-scoring opportunities, contributing to a cumulative rise in total goals.

In essence, the positive correlation between attendance and goals scored is a reflection of the symbiotic relationship between the passionate audience, the duration of the tournament, and the captivating nature of the matches

Visualization #3

Which stage of the tournament has the most goals per game? 

Analyzing the goal-scoring dynamics across different stages of the tournament provides valuable insights into the ebbs and flows of the competition. The visualization, in particular, indicates that the average goals per game exhibit a lack of discernible patterns within the group stage, with generally lower figures compared to subsequent rounds.

Upon closer examination, it becomes evident that the knockout stages, particularly the third-place playoff, Final, and Semi-Final matches, stand out as focal points for heightened goal-scoring excitement. The third-place games notably emerge as high-scoring spectacles, boasting an impressive goal average exceeding 4 per game. This may be attributed to the inherent nature of these matches, where teams are driven to showcase their prowess and secure a podium finish, resulting in a more open and attack-oriented style of play.

Equally noteworthy are the Semi-Final and Final matches, each boasting an average of around 3.5 goals per game. These stages of the tournament, being decisive moments on the path to championship glory, often witness a convergence of top-tier teams with a shared determination to secure victory. This collision of footballing titans contributes to the elevated goal-scoring averages observed in these crucial fixtures. 

In contrast, the group stage appears to be characterized by a more varied and unpredictable pattern in terms of average goals per game. The lower averages during this phase may be attributed to factors such as teams cautiously navigating the early stages of the tournament, strategic considerations, and the emphasis on securing points rather than pursuing high-scoring outcomes.

In summary, while the group stage sets the initial tone for the tournament, it is the knockout stages, particularly the third-place playoff, Semi-Final, and Final matches, that emerge as the crescendos of goal-scoring drama, showcasing the pinnacle of footballing excellence on the global stage.

```
library(shiny)

runGitHub("Project", "rstudio")

```
