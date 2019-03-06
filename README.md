# MathFlow (Project of TartanHacks 2019) 
* An App that automates the workflow from image equations directly to Wolfram &amp; LaTeX codes.
* Built with Swift, C, Shell

# Inspiration
We witnessed the extreme tediousness of copying & pasting among different platforms when math researchers read and compose papers & computable documents. This issue comes from incompatibilities among math equations in image form and major math languages: LaTeX & Wolfram.

# What it does
MathFlow automates the workflow from image equations directly to Wolfram & LaTeX codes. Simply capture a screenshot and codes will pop up. There is also an option to append them to a computable document along with a user comment.

# How we built it
We use Swift to develop the user interface (macOS application). It will call an executable written in C, which combines MathPix (from image to LaTeX) & Wolfram API (from LaTeX to Wolfram) to properly generate the codes. As a key component of the C program, we use regular expression to handle incompatibilities b/w MathPix & Wolfram API.
 
# Challenges we ran into
MathPix output and Wolfram API input have different LaTeX expression grammar. We have to use an interpreter (regular expressions) to bridge them together.

# Accomplishments that we're pround of 
* With regular expression, we mainly address the compatibility issue between LaTeX & Wolfram which allows a "fuzzy mapping" from a typesetting language (displayable) to a semantic language (computable).
* We lessen the burden of math researchers to a significant extent by considering the habits of most math researchers.

# What we learned
* macOS application development using Swift.
* Extensive C network programming and string manipulation.
* Researchers-friendly UI design to simplify workflow.

# What's next for Math Flow
* Support more math languages.
* Make LaTeX interpreter (regular expression) more accurate.
* Improve UI design based on user feedback.
