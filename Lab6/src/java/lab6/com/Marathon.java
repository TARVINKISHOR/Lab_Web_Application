/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package lab6.com;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 *
 * @author Kishor Mohan
 */
public class Marathon {

    private String icno;
    private String name;
    private String category;

    public String getIcno() {
        if (icno == null || icno.isEmpty()) {
            return "invalid";
        }
        Pattern pt = Pattern.compile("\\d{6}-\\d{2}-\\d{4}");
        Matcher mt = pt.matcher(icno);
        if (mt.matches()) {
            return icno;
        } else {
            return "invalid";
        }
    }

    public void setIcno(String icno) {
        this.icno = icno;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

}
