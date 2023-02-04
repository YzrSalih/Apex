public class Player {
    public void playing() {
        String player1Name = 'Edna Mode';
        String player2Name = 'Optimus Prime';
        String player3Name = 'Wednesday Addams';
        String player4Name = 'Woody';
        String player5Name = 'Harry Potter';

        //1. Print all the variables one by one in playing method
        System.debug('Player 1: ' + player1Name);
        System.debug('Player 2: ' + player2Name);
        System.debug('Player 3: ' + player3Name);
        System.debug('Player 4: ' + player4Name);
        System.debug('Player 5: ' + player5Name);

        //2. The number of characters in each Player Name.
            
        Integer player1NameLength = player1Name.length();

        System.debug('Player 1 char number: ' + player1NameLength);
        System.debug('Player 2 char number: ' + player2Name.length());
        System.debug('Player 3 char number: ' + player3Name.length());
        System.debug('Player 4 char number: ' + player4Name.length());
        System.debug('Player 5 char number: ' + player5Name.length());

        //3. Print player1 and player3 in Capital letters
        String player1NameUpperCase = player1Name.toUpperCase();
        System.debug('Player 1 in capital letters: ' + player1NameUpperCase);
        System.debug('Player 3 in capital letters: ' + player3Name.toUpperCase());

    }
}