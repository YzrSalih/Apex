public class RankHandlerTest {
    @isTest
    private static void testRankPrize1() {
        RankHandler rh = new RankHandler();
        string prizeGold = rh.rankPrize(1);
        system.assertEquals('Gold', prizeGold);

        string prizeSilver = rh.rankPrize(2);
        system.assertEquals('Silver', prizeSilver);

        string prizeBronze = rh.rankPrize(3);
        system.assertEquals('Bronze', prizeBronze);

        string prizeTopTen = rh.rankPrize(7);
        system.assertEquals('Top 10', prizeTopTen);

        string prizeOther = rh.rankPrize(77);
        system.assertEquals('Participation certificate', prizeOther);
    }

    @isTest
    private static void testRankPrizeSwitch1() {
        RankHandler rh = new RankHandler();
        string prizeGold = rh.rankPrizeSwitch(1);
        system.assertEquals('Gold', prizeGold);

        string prizeSilver = rh.rankPrizeSwitch(2);
        system.assertEquals('Silver', prizeSilver);

        string prizeBronze = rh.rankPrizeSwitch(3);
        system.assertEquals('Bronze', prizeBronze);

        string prizeTopTen = rh.rankPrizeSwitch(7);
        system.assertEquals('Top 10', prizeTopTen);

        string prizeOther = rh.rankPrizeSwitch(77);
        system.assertEquals('thank you for participating', prizeOther);
    }
}

