@categories = [
    {
      "catname": "Sport",
      "img":"http://api-motorcycle.makingdatameaningful.com/files/Daelim/2004/Altino 125 ES/Daelim_2004_Altino 125 ES.jpg",
    },
    {
      "catname": "Scooter",
      "img":"http://api-motorcycle.makingdatameaningful.com/files/Daelim/2011/A-Four/Daelim_2011_A-Four.jpg",
    },
    {
      "catname": "Naked bike",
      "img":"http://api-motorcycle.makingdatameaningful.com/files/Daelim/2013/VJF 125 RoadSport/Daelim_2013_VJF 125 RoadSport.jpeg",
    },
    {
      "catname": "Custom-cruiser",
      "img":"http://api-motorcycle.makingdatameaningful.com/files/Daelim/2015/Daystar/Daelim_2015_Daystar.jpg",
    },
    {
      "catname": "Cross-motocross",
      "img":"http://api-motorcycle.makingdatameaningful.com/files/Daelim/2011/A-Four/Daelim_2011_A-Four.jpg",
    },
    {
      "catname": "Super motard",
      "img":"http://api-motorcycle.makingdatameaningful.com/files/Daelim/2007/E-Five/Daelim_2007_E-Five.jpg",
    },
    {
      "catname": "Minibike-sport",
      "img":"http://api-motorcycle.makingdatameaningful.com/files/Daelim/2010/S-Five/Daelim_2010_S-Five.jpg",
    },
    {
      "catname": "Minibike-cross",
      "img":"http://api-motorcycle.makingdatameaningful.com/files/Daelim/2018/S300/Daelim_2018_S300.jpeg",
    },
    {
      "catname": "Classic",
      "img":"http://api-motorcycle.makingdatameaningful.com/files/Daelim/2008/NS 125 III/Daelim_2008_NS 125 III.jpg",
    }
]

@categories.each do |category|
  Category.create(category)
end
