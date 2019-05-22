# MKS22X-FinalProject

## Ingredients:
In order to experience the magic of our program, you will need:
```
Processing
A Mouse
```
## Instructions:
## DevLogs:
<p>:shoe: - George's doing<br/>
:goat: - Victoria's doing<br/>
:trollface: - George's and Victoria's doing<br/>

### 5/16/19
:trollface: Had our proposals approved by Mr. K today, so the only thing we really did was set up this really awesome README! We also filled out the Google Form (Final Project Group/Repo Form Spring 2019).
### 5/17/19
:shoe: Started the word class by making the constructor, but nothing much really<br/>
:trollface: Started researching where we could find good word lists that only had words that were actually words, not words that were found using computer science<br/>
### 5/18/19
:shoe: Finished the algorithm needed to find all possible subsets of a word. However, more work is needed to find all the rearrangements of those subsets<br/>
:goat: Made separate java file to find words that are a certain length from the huge list that we have (over 50,000 words). I then passed the method into processing but we may just use it once to get the words for now
### 5/19/19
:shoe: Created the recursive binary search method needed to find whether a "word" was in a dictionary<br/>
:goat: Changed word length in findAllWords method to 10 but have not included that in the searching based on the letters yet<br/>
### 5/20/19
:shoe: I further worked on the algorithm required to create all possible words from a combination of letters. Yesterday, I only found all subset of letters from a given set of letters. Today, I was able to create all permutations of subsets of letters, which in total give all the possible words a word can be made from a given word.<br/>
:goat: I worked on writing some of the methods for the Soup Class. In class, I focused on the constructor and continued to work on it at home. I still have a NullPointerException but am currently resolving it on another branch. I also added the missing parantheses to one of the methods in Word in order to make sure that testing can be done. Lastly, I put the folder HowWeMadeTheWords into the folder WordGame to make it easier to access words.txt so I updated the name in the Word class too. <br/>
### 5/21/19
:shoe: I first fixed a minor error in our checkIsValid() method. And then I created a new class called NoDupAR that extends the ArrayList class so that the allPossWords variable will never contain duplicates.
:goat: I continued working on the Soup class and finished the constructor. I also finished the shuffle() method (but need to test it) and I transferred my commits from the branch workonsoup to the master so now it runs!
