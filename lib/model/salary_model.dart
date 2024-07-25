class Salary{
  
  String description;
  double prise;
  String createdDate;

  Salary({required this.createdDate, required this.description, required this.prise});

   Salary.fromJson(Map<String,Object?> json) :
    
    description = json["description"] as String,
    prise = json["prise"] as double,
    createdDate = json["createdDate"] as String;

    Map<String,Object> toMap(){
      return {
       
       "description" : description,
       "prise" : prise,
       "createdDate" : createdDate
      };
    }

    @override
    String toString(){
      return "Description : $description, price : $prise, createDate : $createdDate";
    }
}