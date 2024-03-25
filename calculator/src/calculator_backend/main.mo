actor Calculator{
var num: Int = 0;


public func addition(input: Int) : async Int {
  num += input;
  num
};


public func Subtraction(input: Int) : async Int{
  num -= input;
  num
};


public func Multiplication(input: Int): async Int{
  num *= input;
  num
};

public func Division(input: Int) : async ?Int{

  if(input == 0){
    null
  } else {
    num /= input;
    ?num
  };

};


public func Clean() : async() { 
  num := 0;
};

};