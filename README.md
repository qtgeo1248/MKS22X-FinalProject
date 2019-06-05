# MKS22X-FinalProject

## Ingredients:
In order to experience the magic of our program, you will need:
```
Processing
A Mouse
```
## Instructions:
1. Navigate to our repo (and the sketch WordGame) and open processing!
2. Click the play/run button in the upper left corner.
3. When your screen appears, you will see a gray crossword and a big orange bowl with letters in it. Your goal is to make words from the letters you are given! There is one special word per level!
4. Click on the letters that you want to use to make a word. Be sure to click on the bottom left corner of the letter! If you don’t, WE WILL CHOOSE A LETTER FOR YOU that will be added to the word you are trying to make :happy:
5. Once you have clicked on the letters you want to make a word, go to the right side and click on the blue submit button!
6. Once you make one word, keep trying to find the rest of the words! If you’re having trouble finding more words, use the red shuffle button on the left side of the soup.
7. Once in a while, you will see a word that is separated from the rest. This is the special word. It is a harder word to find because there is no clue for it.
8. If you find a word that is not part of the crossword, it will be counted as a bonus word! It gives brownie points.
9. Once you have found all of the words for the level along with the special word if it exists, we will tell you “Congratulations!” and take you to the very next level where you can try your hand at making more words from a different set of letters!<br/>

**What's also interesting is the Spanish version:** :smile:
- There is a separate sketch folder named WordGameSpan. If you follow the above directions for it, you can play the game in Spanish!
![Bowl of Soup](https://media0.giphy.com/media/5xtDarBbqdSQxfGFdNS/giphy.gif?cid=790b76115cee9e746c34542e6fed6d1e&rid=giphy.gif)
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
:shoe: I first fixed a minor error in our checkIsValid() method. And then I created a new class called NoDupAR that extends the ArrayList class so that the allPossWords variable will never contain duplicates. <br/>
:goat: I continued working on the Soup class and finished the constructor. I also finished the shuffle() method (but need to test it) and I transferred my commits from the branch workonsoup to the master so now it runs! <br/>
### 5/22/19
:shoe: I first fixed a minor error in our checkIsValid() method. And then I created a new class called NoDupAR that extends the ArrayList class so that the allPossWords variable will never contain duplicates.<br/>
:goat: I continued working on the Soup class and finished the constructor. I also finished the shuffle() method (but need to test it) and I transferred my commits from the branch workonsoup to the master so now it runs! <br/>
### 5/23/19
:shoe: I mainly did maintenance work today. I updated the UML Diagram and pushed it onto the github. In addition, I worked on the beginnings of the Crossword class, by making get methods, check methods, and a constructor. In addition, I also did the Word class in which I can input coordinates it is in on the crossword grid. I started on figuring out how to display the crossword class, which requires some for loops. I was only able to finish desplaying the special word in the crossword and only started figuring out how to do the rest. I didn't do anything else because I have an AP tomorrow.<br/>
:goat: I worked and committed on my branch workonsoup, corrected the error that wasn't showing the last letter of a word in the soup, made the display evenly spaced from the center and other letters, and implemented shuffling as a field in the Soup class. I didn't test it for true yet (but will in a later stage). Lastly, I added comments to a few methods we wrote. <br/>
### 5/24/19
:goat: I merged my work on the branch workonsoup to master and implemented the use of the new level class in soup. I started working on the mouse choosing letters. I continued working on the interactivity of the mouse and created a new array that will keep track of which letters are chosen. I wrote 2 helper methods that determine whether the mouse is on the letter and another one that will be implemented later to create a String of the word based on whether the letters were chosen.<br/>
:shoe: I got sick taking the AP exam, so my brain couldn't concentrate har enough to do work today. I promise I'll make it up someday.<br/>
<img src="https://media.giphy.com/media/O0TdwJm7LKXqE/giphy.gif" width="500" height="500"/>
### 5/25/19
:shoe: I finished the display method for crossword that displays the current condition of the crossword, by displaying the special word, squares of the crossword, and the characters in the crossword.<br/>
:goat: I continued working on the helper methods that determined where a letter was in order to make a letter (if chosen) light up or look different. <br/>
### 5/26/19
:shoe: I finished the addWord method for the crossword such that it will add the word and return true, but return false only when it doesn't fit onto the board, crosses with a word incorrectly, or doesn't cross with the crossword at all. I will attempt the addallwords method tomorrow.<br/>
:goat: I made a new branch to work on and test the mouse interactivity. I have the mouse coordinates compared to where the letters are but it is not currently updating so I added print statements. I should switch to a larger radius so that if the user hits a few values off the correct x or y-coordinate, it will still be counted as hitting that letter. <br/>
### 5/27/19
:goat: I moved the mouse method from the Soup class to WordGame and it is partially working. Some of the letters change color correctly when they are clicked on but others if you click on them, change the color of a different letter (minor bug needs to be resolved). <br/>
:shoe: I started working on the addAllWords method, but first, it required me to find all the intersections of two given words (i.e. where are places where two letters are in common) and the coordinates of where they should be. I then needed to sort it based on distance from the crossword, as to make as good of a crossword as possible you would need to place the endings far away. <br/>
### 5/28/19
:goat: I worked on creating the shuffle button and displaying it along with an image. I also added to the mousePressed method by making sure that if the user clicks on the shuffle circle button, then it is detected. Lastly, the constructor for soup has one less parameter now because I didn't need a boolean for shuffling. <br/>
:shoe: I finished the addAllWords method, which was done by finishing the algorithm of adding words into the crosswords given its intersections with the current crossword. It currently requires some updates. I just to make it so words don't touch each other at all and them I'm done. <br/>
### 5/29/19
:shoe: I started did what I promised to do yesterday, which was that I needed to resolve an issue with addAllWords where words were allowed to be adjacent to each other. I only fixed the non-edge cases, which was just a simple couple of booleans. <br/>
:goat: I resolved the issue with the circle (representing whether a letter was chosen) remaining after shuffling. I continued working on correcting the "chosen" aspect appearing but there's a mismatch in the pairing of the letter's coordinates so that choosing a letter works for only some of the letters. <br/>
### 5/30/19
:goat: I finally fixed the issue with different letters becoming chosen because I realized that 2 letters could have the same x-coordinates or the same y-coordinates. So that bug is squashed now! I also merged my branch (mouse) to the master and then started working on the submit button (for making words). <br/>
:shoe: I finished resolving issues that the addAllWords method had. The issue I fixed was that at the edge of a currently added word, it was unable to detect whether or not if the squares adjacent to it was the word it was supposed to be intersecting, or the word that just so happened to be next to it, which is not allowed. This required a lot more work. However, that was all I did since I had ARML tomorrow and needed to rest before going.<br/>
<img src="https://media.giphy.com/media/1jl173guBKkbvC03rQ/giphy.gif" width="1500" height="500"/>
### 5/31/19
:goat: In class, I worked on interactivity with the submit button. I'm close to being done with it but now I just need to see if the word that the user has made is an actual word and if it's in the crossword that we have.<br/>
:shoe: Once I finished with the addAllWords method, I worked on how to make one of the all possible words to be a special word, which was not hard. A special word needed to be a word that is the largest length that is smaller than the original word.<br/>
### 6/1/19
:shoe: I had ARML that day, but because electronics were taken away the entire day, I could not code. In addition, I fell asleep as soon as I got home.<br/>
:goat: I took my SAT II today and was also sick so I didn't do as much as yesterday. I worked on making the submit button capture the letters chosen and then be able to erase them. <br/>
### 6/2/19
:shoe: I finished the checkUnfounded words method, which requires a lot of work since it first checks if it's part of the crossword, but then if it is, it adds the word to the crossword and changes its color to a very fun green!<br/>
:goat: I continued working on the submit button and made progress with keeping track of the letters. The chosen letters still appear chosen after submitting, but if I check it with the crossword method, that's a better way to check if the word the user has chosen is an actual word.
### 6/3/19
:shoe: I worked on the other check methods which modified the Crossword whenever you checked if a word was part of the crossword, was already found, if it's a regular word, or if it's not a word at all.<br/>
:goat: I worked on the submit button and was able to organize the letters into an ArrayList. I also worked more on the display methods to make sure everything is aligned and that there are appropriate responses to where the mouse clicks. <br/>
### 6/4/19
:trollface: We did partner coding (4 hours straight :smile:) so that we were able to mix our two parts together (which were the crossword (which George did) and the user input on the soup (which Victoria did)). We created the levels, the checking of the words given a submitted word, the background images, and the ability to move on to the next level. We also fixed some errors which were caused by mixing the two parts together.<br/>
## Sources && Inspiration
- One of the sources we used for the Spanish dictionary was: https://github.com/bitcoin/bips/blob/master/bip-0039/spanish.txt
- Another source we used for the english dictionary was: http://www.gwicks.net/dictionaries.htm
<img src="https://media.giphy.com/media/26gsfdArwyEnXnDGw/source.gif" width="1500" height="500"/>
