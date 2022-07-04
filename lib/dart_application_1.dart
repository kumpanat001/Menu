import 'dart:io'; //นำเข้าฟังก์ชันในการรับค่าจากคีย์บอร์ด

List menu_drink = ["น้ำเปล่า", "นม", "น้ำอัดลม", "M150", "กาแฟ"]; //กำหนดเมนูเครื่องดืม
List munu_candy = ["ตะวัน", "เลย์", "ซันไบร์ท", "ถั่วลิสง", "ปลาเส้น"]; //กำหนดเมนูขนม
List munu_food = ["กระเพรา", "ข้าวผัด", "ข้าวไข่เจียว", "สุกกี้", "ก๋วยเตี๋ยว"]; //กำหนดเมนูอาหาร

List price_drink = [10, 15, 20, 10, 40]; //กำหนดราคาเครื่องดื่ม
List price_candy = [10, 20, 10, 15, 15]; //กำหนดราคาขนม
List price_food = [40, 40, 35, 50, 40]; //กำหนดราคาอาหาร

int start_list = 1; //กำหนดจุดเริ่มต้นของเมนูอาหาร
int i = 0; //กำหนดตัวแปร i ไว้สำหรับวนลูปแสดงรายการ

void type() {
  print("กรุณาเลือกประเภทเมนู");
  print("[1.]เครื่องดื่ม  [2.]ขนม [3.]อาหาร [0]จบการทำงาน");
  int? menu = int.parse(stdin.readLineSync()!); //รับค่า 1 2 3 และ 0 จากคีย์บอร์ด
  switch (menu) { // เลือกประเภท
    case 0: //กด 0 เพื่อจบการทำงาน
      print("จบการทำงาน");
      break;
    case 1: //กด 1 เพื่อเลือกเมนูประเภทเครื่องดื่ม
      menu_1();
      break;
    case 2://กด 2 เพื่อเลือกเมนูประเภทขนม
      menu_2();
      break;
    case 3://กด 3 เพื่อเลือกเมนูประเภทอาหาร
      menu_3();
      break;
    default:
  }
}

void menu_1() { //เครื่องดื่ม
  print("เมนู เครื่องดื่ม");
  for (i = 0; i <= 4; i++) { //วนลูปเพื่อแสดง เมนู และ ราคา ประเภทเครื่องดื่ม โดยนำ พารามิเตอร์ menu_drink และ price_drink มาแสดง
    print("$start_list\t" +menu_drink[i] +"ราคา \t" +price_drink[i].toString() +"\tบาท");
    start_list++;
  }
  start_list = 1;
  i = 1;
  int? confirm = int.parse(stdin.readLineSync()!);
  print("คุณเลือก : " +menu_drink[confirm - 1] +" ราคา : " +price_drink[confirm - 1].toString() +" บาท");//ทวนรายการที่เลือก
  payment(menu_drink[confirm - 1], price_drink[confirm - 1]); //ฟังก์ชั่นการชำระเงิน
  type();//เรียกฟังก์ชั่น type() มาแสดงประเภทเมนูใหม่
}

void menu_2() {   //ขนม
  print("เมนู ขนม");
  for (i = 0; i <= 4; i++) { //วนลูปเพื่อแสดง เมนู และ ราคา ประเภทเครื่องดื่ม โดยนำ พารามิเตอร์ munu_candy และ price_candy มาแสดง
    print("$start_list\t" +munu_candy[i] +" ราคา " +price_candy[i].toString() +"\tบาท");
    start_list++;
  }
  start_list = 1;
  i = 1;
  int? confirm = int.parse(stdin.readLineSync()!);
  print("คุณเลือก : " +munu_candy[confirm - 1] +" ราคา : " +price_candy[confirm - 1].toString() +" บาท");//ทวนรายการที่เลือก
  payment(munu_candy[confirm - 1], price_candy[confirm - 1]);//ฟังก์ชั่นการชำระเงิน
  type();//เรียกฟังก์ชั่น type() มาแสดงประเภทเมนูใหม่
}

void menu_3() {  //อาหาร
  print("เมนู อาหาร");
  for (i = 0; i <= 4; i++) {//วนลูปเพื่อแสดง เมนู และ ราคา ประเภทเครื่องดื่ม โดยนำ พารามิเตอร์ munu_food และ price_food มาแสดง
    print("$start_list\t" +munu_food[i] +" ราคา " +price_food[i].toString() +"\tบาท");
    start_list++;
  }
  start_list = 1;
  i = 1;
  int? confirm = int.parse(stdin.readLineSync()!);
  print("คุณเลือก : " +munu_food[confirm - 1] +" ราคา : " +price_food[confirm - 1].toString() +" บาท");//ทวนรายการที่เลือก
  payment(munu_food[confirm - 1], price_food[confirm - 1]);//ฟังก์ชั่นการชำระเงิน
  type();//เรียกฟังก์ชั่น type() มาแสดงประเภทเมนูใหม่
}

void payment(String name, int price) {
  print("กรุณาชำระเงิน ใส่จำนวนเงิน : ");
  int? payment = int.parse(stdin.readLineSync()!); //รับค่าจำนวนเงินที่ได้รับ มาเป็นไว้ในตัวแปร payment
  int payment_s = payment - price; //จำนวนเงินที่ได้รับ - ราคาของสิ้นค้านั้นๆ
  if (payment < price) { //เมื่อจำนวนเงินที่ใส่ไม่พอ
    print("จำนวนเงินคุณไม่เพียงพอ กรุณาเลือกเมนูอื่น");
    type(); //เลือกประเภทเมนูอื่นๆ
  } else { // สรุป การรับเงิน และ การทอนเงิน
    print("รับเงินมาจำนวน : " +payment.toString() +" บาท " +" เงินทอน จำนวน : " +payment_s.toString());
  }
}
