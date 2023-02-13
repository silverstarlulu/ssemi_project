package ssemi.ssemibucks.USER;

import java.util.Scanner;

public class UserService {

    UserDao userDao = new UserDao();
    Scanner sc = new Scanner(System.in);

    //로그인
    public String loginUser() {
        boolean flag = false;
        User user;

        do {
            System.out.println("[Log in]");
            System.out.print("아이디: ");
            String uId = sc.nextLine();
            System.out.print("비밀번호: ");
            String pw = sc.nextLine();

            user = new User(uId, pw);

            if (userDao.findByUser(uId) == null)
                System.out.println("해당 아이디가 존재하지 않습니다.\n");

            else if (userDao.findByUser(uId).getuId().equals(user.getuId()) && !userDao.findByUser(uId).getPw().equals(user.getPw()))
                System.out.println("비밀번호가 일치하지 않습니다.\n");

            else {
                System.out.println(user.getuId() + "님 환영합니다.\n");
                flag = true;
            }
        } while (!flag);

        return user.getuId();
    }

    //회원가입
    public void registerUser() {
        System.out.println("[Sign up]");
        userDao.insertUser();
        loginUser();
    }

    //마이페이지
    public void myPage() {
        System.out.println("[My Page]");
        userDao.selectUser();

        while (true) {
            System.out.println("1.정보수정\t2.회원탈퇴\t0.돌아가기");
            System.out.print("입력 >> ");

            int num = Integer.parseInt(sc.nextLine());
            switch (num) {
                case 1:
                    userDao.updateUser();
                    break;
                case 2:
                    userDao.deleteUser();
                    break;
                case 0:
                    System.out.println("취소합니다.");
                    return;
                default:
                    System.out.println("재입력하세요.");
            }
        }

    }

    //회원관리
    public void management() {
        while (true) {
            System.out.println("[관리자 페이지]");
            System.out.println("1. 회원목록확인\t2. 회원 강제탈퇴\t0. 종료");
            System.out.print("입력 >> ");

            int num = Integer.parseInt(sc.nextLine());
            switch (num) {
                case 1:
                    userDao.selectAllUser();
                    break;
                case 2:
                    userDao.deleteUser();
                    break;
                case 0:
                    System.out.println("관리자 모드 종료");
                    System.exit(0);
                default:
                    System.out.println("재입력하세요");
            }
        }


    }

}
