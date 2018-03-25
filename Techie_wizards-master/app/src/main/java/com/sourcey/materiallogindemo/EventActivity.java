package com.sourcey.materiallogindemo;

import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;

import butterknife.BindView;
import butterknife.ButterKnife;
import butterknife.OnClick;

public class EventActivity extends AppCompatActivity {

    @BindView(R.id.icon_lecture_text1)
    TextView iconLectureText1;
    @BindView(R.id.more)
    Button more;
    @BindView(R.id.icon_lecture_text2)
    TextView iconLectureText2;
    @BindView(R.id.less)
    Button less;
    @BindView(R.id.career)
    Button career;
    @BindView(R.id.leadership)
    Button leadership;
    @BindView(R.id.icon1_lecture_text1)
    TextView icon1LectureText1;
    @BindView(R.id.more1)
    Button more1;
    @BindView(R.id.icon1_lecture_text2)
    TextView icon1LectureText2;
    @BindView(R.id.less1)
    Button less1;
    @BindView(R.id.career1)
    Button career1;
    @BindView(R.id.leadership1)
    Button leadership1;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_event);
        ButterKnife.bind(this);
        more.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                more.setVisibility(View.GONE);
                career.setVisibility(View.VISIBLE);
                leadership.setVisibility(View.VISIBLE);
                less.setVisibility(View.VISIBLE);
                iconLectureText1.setVisibility(View.VISIBLE);
                iconLectureText2.setVisibility(View.VISIBLE);
            }
        });
        less.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                more.setVisibility(View.VISIBLE);
                career.setVisibility(View.GONE);
                leadership.setVisibility(View.GONE);
                less.setVisibility(View.GONE);
                iconLectureText1.setVisibility(View.VISIBLE);
                iconLectureText2.setVisibility(View.GONE);
            }
        });
    }

    @OnClick({R.id.more1, R.id.less1})
    public void onViewClicked(View view) {
        switch (view.getId()) {
            case R.id.more1:
                more1.setVisibility(View.GONE);
                career1.setVisibility(View.VISIBLE);
                leadership1.setVisibility(View.VISIBLE);
                less1.setVisibility(View.VISIBLE);
                icon1LectureText1.setVisibility(View.VISIBLE);
                icon1LectureText2.setVisibility(View.VISIBLE);
                break;
            case R.id.less1:
                more1.setVisibility(View.VISIBLE);
                career1.setVisibility(View.GONE);
                leadership1.setVisibility(View.GONE);
                less1.setVisibility(View.GONE);
                icon1LectureText1.setVisibility(View.VISIBLE);
                icon1LectureText2.setVisibility(View.GONE);
                break;
        }
    }
}
