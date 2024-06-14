# Insults.ps1

# Define an array of insults
$insults = @(
"In the words of Shakespeare, 'Thou art a boil, a plague sore, an embossed carbuncle in my corrupted blood, meatbag...'",
"As Winston Churchill once said, 'I may be drunk, Miss, but in the morning I will be sober and you will still be a meatbag...'",
"Oscar Wilde might say, 'Some cause happiness wherever they go; others, whenever they go. You, meatbag, are firmly in the second category...'",
"According to Mark Twain, 'I didn't attend the funeral, but I sent a nice letter saying I approved of it.' That's how I feel about your code, meatbag...",
"As Dorothy Parker once said, 'You can lead a horticulture, but you can't make her think.' The same applies to you, meatbag...",
"In the words of Groucho Marx, 'I've had a perfectly wonderful evening, but this wasn't it.' That's how I feel about our coding session, meatbag...",
"As Mae West might say, 'When I'm good, I'm very good, but when I'm bad, I'm better.' You, meatbag, are neither...",
"According to Albert Einstein, 'Two things are infinite: the universe and human stupidity; and I'm not sure about the universe.' You're proof of that, meatbag...",
"In the words of Winston Churchill, 'You have all the virtues I dislike and none of the vices I admire.' That sums you up, meatbag...",
"As Margaret Thatcher once said, 'If you want something said, ask a man; if you want something done, ask a woman.' If you want nothing at all, ask a meatbag...",
"According to Mark Twain, 'Suppose you were an idiot, and suppose you were a member of Congress; but I repeat myself.' The same could be said for you, meatbag...",
"In the words of Oscar Wilde, 'True friends stab you in the front.' But you, meatbag, wouldn't know the first thing about truth...",
"As Groucho Marx might say, 'I never forget a face, but in your case I'll be glad to make an exception.' That's how I feel about your code, meatbag...",
"According to Dorothy Parker, 'This is not a novel to be tossed aside lightly. It should be thrown with great force.' Much like your code, meatbag...",
"In the words of Mae West, 'Between two evils, I always pick the one I never tried before.' But you, meatbag, are a whole new level of evil...",
"As Albert Einstein once said, 'Only two things are infinite, the universe and human stupidity, and I'm not sure about the former.' You're a testament to that, meatbag...",
"According to Winston Churchill, 'A lie gets halfway around the world before the truth has a chance to get its pants on.' Your code, meatbag, is that lie...",
"In the words of Mark Twain, 'Get your facts first, then you can distort them as you please.' But you, meatbag, wouldn't know a fact if it hit you in the face...",
"As Oscar Wilde might say, 'I am so clever that sometimes I don't understand a single word of what I am saying.' You, meatbag, are the opposite...",
"According to Groucho Marx, 'Those are my principles, and if you don't like them... well, I have others.' But you, meatbag, wouldn't know a principle if it bit you...",
"In the words of Dorothy Parker, 'The first thing I do in the morning is brush my teeth and sharpen my tongue.' You, meatbag, should try it sometime...",
"As Mae West once said, 'When choosing between two evils, I always like to try the one I've never tried before.' But you, meatbag, are an evil I'd rather avoid...",
"According to Albert Einstein, 'The difference between stupidity and genius is that genius has its limits.' You, meatbag, are limitless...",
"In the words of Winston Churchill, 'I may be drunk, Miss, but in the morning I will be sober and you will still be ugly.' In your case, meatbag, you'll still be clueless...",
"As Mark Twain might say, 'Go to Heaven for the climate, Hell for the company.' You, meatbag, would be the exception...",
"According to Oscar Wilde, 'I can resist everything except temptation.' But you, meatbag, are no temptation...",
"In the words of Groucho Marx, 'I find television very educating. Every time somebody turns on the set, I go into the other room and read a book.' You, meatbag, are the television...",
"As Dorothy Parker once said, 'Beauty is only skin deep, but ugly goes clean to the bone.' You, meatbag, are bone deep...",
"According to Mae West, 'You only live once, but if you do it right, once is enough.' But you, meatbag, are doing it all wrong...",
"In the words of Albert Einstein, 'Education is what remains after one has forgotten what one has learned in school.' You, meatbag, have forgotten everything...",
"As Winston Churchill might say, 'My most brilliant achievement was my ability to be able to persuade my wife to marry me.' Your code, meatbag, is no achievement...",
"According to Mark Twain, 'It's not the size of the dog in the fight, it's the size of the fight in the dog.' You, meatbag, have no fight...",
"In the words of Oscar Wilde, 'Experience is simply the name we give our mistakes.' You, meatbag, are full of experience...",
"As Groucho Marx once said, 'I've had a perfectly wonderful evening, but this wasn't it.' That's how I feel about our coding session, meatbag...",
"According to Dorothy Parker, 'If you want to know what God thinks of money, just look at the people he gave it to.' If you want to know what I think of you, meatbag, just look at your code...",
"In the words of Mae West, 'I used to be Snow White, but I drifted.' You, meatbag, have drifted off course...",
"As Albert Einstein might say, 'The only source of knowledge is experience.' You, meatbag, are sorely lacking...",
"According to Winston Churchill, 'Success is not final, failure is not fatal: It is the courage to continue that counts.' You, meatbag, lack courage...",
"In the words of Mark Twain, 'The secret of getting ahead is getting started.' You, meatbag, are stuck in place...",
"As Oscar Wilde once said, 'Be yourself; everyone else is already taken.' But you, meatbag, should try being someone else...",
"According to Groucho Marx, 'I refuse to join any club that would have me as a member.' I feel the same about your code, meatbag...",
"In the words of Dorothy Parker, 'If you have any young friends who aspire to become writers, the second greatest favor you can do them is to present them with copies of The Elements of Style. The first greatest, of course, is to shoot them now, while they’re happy.' You, meatbag, could use both...",
"As Mae West might say, 'I'll try anything once, twice if I like it, three times to make sure.' But your code, meatbag, I wouldn't try even once...",
"According to Albert Einstein, 'Imagination is more important than knowledge.' You, meatbag, lack both...",
"In the words of Winston Churchill, 'We make a living by what we get, but we make a life by what we give.' You, meatbag, have given nothing but trouble...",
"As Mark Twain once said, 'The man who does not read has no advantage over the man who cannot read.' You, meatbag, have no advantage...",
"According to Oscar Wilde, 'Always forgive your enemies; nothing annoys them so much.' But you, meatbag, are beyond forgiveness...",
"In the words of Groucho Marx, 'Behind every successful man is a woman, behind her is his wife.' Behind every failed code, meatbag, is you...only you..."
# ...
)

function InsultUser {
    # Get a random insult from the array
    $randomInsult = Get-Random -InputObject $global:insults
    return $randomInsult
}

function InsultUserNpause {
    # Get a random insult from the array
    $randomInsult = InsultUser
    # Output the random insult and prompt the user to continue
    Write-Host " "
    Write-Host "$randomInsult..." -ForegroundColor Cyan
    Write-Host " "
    Start-Sleep -Seconds 5
}
