public with sharing class OperationHelperTest {
    @isTest
    private static void testMethodLargest1() {
        OperationsHelper oh = new OperationsHelper();

        decimal d1 = oh.largestOutOfTwoNumbers(45, 44);
        system.assertEquals(45, d1);

        decimal d2 = oh.largestOutOfTwoNumbers(42, 44);
        system.assertEquals(44, d2);
    }

    @isTest
    private static void testMethodSmallest1() {
        OperationsHelper oh = new OperationsHelper();

        decimal d1 = oh.smallestOutOfThreeNumbers(99, 444,555);
        system.assertEquals(99, d1);
    }

    @isTest
    private static void testMethodSum1() {
        OperationsHelper oh = new OperationsHelper();

        decimal d1 = oh.sumOfPositiveInteger(2);
        system.assertEquals(3, d1);

        decimal d2 = oh.sumOfPositiveInteger(-2);
        system.assertEquals(null, d2);
    }
}