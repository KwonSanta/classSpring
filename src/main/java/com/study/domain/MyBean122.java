package com.study.domain;

import java.util.List;

public class MyBean122 {
    private String name;
    private String team;
    private String country;
    private String sports;
    private List<String> positions;

    public MyBean122() {
    }

    public MyBean122(String name, String team, String country, String sports, List<String> positions) {
        this.name = name;
        this.team = team;
        this.country = country;
        this.sports = sports;
        this.positions = positions;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getTeam() {
        return team;
    }

    public void setTeam(String team) {
        this.team = team;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getSports() {
        return sports;
    }

    public void setSports(String sports) {
        this.sports = sports;
    }

    public List<String> getPositions() {
        return positions;
    }

    public void setPositions(List<String> positions) {
        this.positions = positions;
    }
}
