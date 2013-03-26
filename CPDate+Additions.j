@implementation CPDate (parts)
- (CPString)monthByName
{
        //returns the month by it's actual name
        var month = self.getMonth();
        switch(month){
                case 0: month = @"January";
                        break;

                case 1: month = @"February";
                        break;

                case 2: month = @"March";
                        break;

                case 3: month = @"April";
                        break;

                case 4: month = @"May";
                        break;

                case 5: month = @"June";
                        break;

                case 6: month = @"July";
                        break;

                case 7: month = @"August";
                        break;

                case 8: month = @"September";
                        break;

                case 9: month = @"October";
                        break;

                case 10:month = @"November";
                        break;

                case 11:month = @"December";
                        break;
        }
        return month;
}

- (CPString)longStringDate
{
    return [self monthByName] + " " + [self enlongatedDay] + ", " + self.getFullYear();
}

- (CPString)enlongatedDay
{
    var day = String(self.getDate());

    if (day.length === 2 && day[1] === "1")
        return day + "st";
    
    // if the last character is ...
    if (day[day.length] === "1")
        return day + "st";
    else if (day[day.length] === "2")
        return day + "nd";
    else if (day[day.length] === "3")
        return day + "rd";
    else
        return day + "th";

    /*
        -1st
        -2nd
        -3rd
        4th
        5th
        6th
        7th 
        8th
        9th
        10th
        11th
        13th
        20th
        -21st
        -22nd
        -23rd
        24th
        30th
        -31st
    */
}
@end
