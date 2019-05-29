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
:shoe: Started the word class by making the constructor, but nothing much really.<br/>
:trollface: Started researching where we could find good word lists that only had words that were actually words, not words that were found using computer science.<br/>
### 5/18/19
:shoe: Finished the algorithm needed to find all possible subsets of a word. However, more work is needed to find all the rearrangements of those subsets.<br/>
:goat: Made separate java file to find words that are a certain length from the huge list that we have (over 50,000 words). I then passed the method into processing but we may just use it once to get the words for now.
### 5/19/19
:shoe: Created the recursive binary search method needed to find whether a "word" was in a dictionary.<br/>
:goat: Changed word length in findAllWords method to 10 but have not included that in the searching based on the letters yet.<br/>
### 5/20/19
:shoe: I further worked on the algorithm required to create all possible words from a combination of letters. Yesterday, I only found all subset of letters from a given set of letters. Today, I was able to create all permutations of subsets of letters, which in total give all the possible words a word can be made from a given word.<br/>
:goat: I worked on writing some of the methods for the Soup Class. In class, I focused on the constructor and continued to work on it at home. I still have a NullPointerException but am currently resolving it on another branch. I also added the missing parantheses to one of the methods in Word in order to make sure that testing can be done. Lastly, I put the folder HowWeMadeTheWords into the folder WordGame to make it easier to access words.txt so I updated the name in the Word class too. <br/>
### 5/21/19
:shoe: I first fixed a minor error in our checkIsValid() method. And then I created a new class called NoDupAR that extends the ArrayList class so that the allPossWords variable will never contain duplicates.
:goat: I continued working on the Soup class and finished the constructor. I also finished the shuffle() method (but need to test it) and I transferred my commits from the branch workonsoup to the master so now it runs!
### 5/22/19
:shoe: I first fixed a minor error in our checkIsValid() method. And then I created a new class called NoDupAR that extends the ArrayList class so that the allPossWords variable will never contain duplicates.<br/>
:goat: I continued working on the Soup class and finished the constructor. I also finished the shuffle() method (but need to test it) and I transferred my commits from the branch workonsoup to the master so now it runs!
### 5/23/19
:shoe: I mainly did maintenance work today. I updated the UML Diagram and pushed it onto the github. In addition, I worked on the beginnings of the Crossword class, by making get methods, check methods, and a constructor. In addition, I also did the Word class in which I can input coordinates it is in on the crossword grid. I started on figuring out how to display the crossword class, which requires some for loops. I was only able to finish desplaying the special word in the crossword and only started figuring out how to do the rest. I didn't do anything else because I have an AP tomorrow.<br/>
:goat: I worked and committed on my branch workonsoup, corrected the error that wasn't showing the last letter of a word in the soup, made the display evenly spaced from the center and other letters, and implemented shuffling as a field in the Soup class. I didn't test it for true yet (but will in a later stage). Lastly, I added comments to a few methods we wrote.
### 5/24/19
:goat: I merged my work on the branch workonsoup to master and implemented the use of the new level class in soup. I started working on the mouse choosing letters. I continued working on the interactivity of the mouse and created a new array that will keep track of which letters are chosen. I wrote 2 helper methods that determine whether the mouse is on the letter and another one that will be implemented later to create a String of the word based on whether the letters were chosen.<br/>
:shoe: I got sick taking the AP exam, so my brain couldn't concentrate har enough to do work today. I promise I'll make it up someday.<br/>
<img src="https://media.giphy.com/media/O0TdwJm7LKXqE/giphy.gif" width="500" height="500"/>
### 5/25/19
:shoe: I finished the display method for crossword that displays the current condition of the crossword, by displaying the special word, squares of the crossword, and the characters in the crossword.<br/>
### 5/26/19
:shoe: I finished the addWord method for the crossword such that it will add the word and return true, but return false only when it doesn't fit onto the board, crosses with a word incorrectly, or doesn't cross with the crossword at all. I will attempt the addallwords method tomorrow.
### 5/27/19
:shoe: I started working on the addAllWords method, but first, it required me to find all the intersections of two given words (i.e. where are places where two letters are in common) and the coordinates of where they should be. I then needed to sort it based on distance from the crossword, as to make as good of a crossword as possible you would need to place the endings far away.
