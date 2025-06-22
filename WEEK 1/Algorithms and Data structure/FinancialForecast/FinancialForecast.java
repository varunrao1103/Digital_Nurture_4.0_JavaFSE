public class FinancialForecast {

    public static double predictValue(int years, double initialValue, double growthRate) {
        if (years == 0) return initialValue;

        return predictValue(years - 1, initialValue, growthRate) * (1 + growthRate);
    }

    public static void main(String[] args) {
        double initialValue = 1000;
        double growthRate = 0.10; 
        int years = 5;

        double futureValue = predictValue(years, initialValue, growthRate);
        System.out.printf("Future Value after %d years: %.2f\n", years, futureValue);
    }
}
