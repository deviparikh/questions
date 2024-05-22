---
layout: default
urltitle: Questions by Devi Parikh
title: No small talk. Meaningful conversations.
description: No small talk. Meaningful conversations.
categories: No small talk. Meaningful conversations.
favicon: static/img/questions.png
permalink: ./
---
<div class="container">
    <p class="center">
        <a href="https://twitter.com/share?ref_src=twsrc%5Etfw" class="twitter-share-button" data-text="Prefer deeper connections over small talk? This simple conversation tool by @deviparikh is pretty cool!" data-show-count="false">Tweet</a>
        <script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>
        <a href="./instructions.html">Instructions</a>
        <!-- <a href="#" onclick="javascript:window.location.href='mailto:deviparikh.dp@gmail.com?subject=Question suggestion&body=Question: %0d%0a%0d%0a(Optional) Question source (e.g., your name if you came up with the question): %0d%0a%0d%0a(Optional) Question source link (e.g., link to your webpage or Twitter): '">Contribute</a> -->
        <!-- <a href="../">Devi</a>'s -->
        <!-- <a href="../art.html">Art</a> -->
        <br><br>
        <a name="artlnk" id="artlnk" href="https://deviparikh.com/create_your_own/tessellation.html"><img name="art" id="art" alt="art" height="250"></a>
        <br><br>
        <button type="newQuestion" id="newQButton" onclick="newQuestion()">New Question</button>
        <br><br>
        <font class="question" name="q" id="q"></font>
        <br>
        <!-- <font class = "source" >&mdash;</font> -->
        <a name="srclnk" id="srclnk">
            <font name="src" id="src"></font>
        </a>
        <script src="./static/data/questions.js"></script>
        <script src="./static/data/art.js"></script>
        <script type="text/javascript">
        // console.log(qlist.length);
        // console.log(alist.length);
        // console.log(alist[newArtId].length);
        window.onload = function() {
            var url_string = window.location.href;
            var url = new URL(url_string);

            var qid = url.searchParams.get("qid");
            // var aid = url.searchParams.get("aid");
            var apid = url.searchParams.get("apid");
            if (qid == null) {
                qid = Math.floor(Math.random() * qlist.length);
                url.searchParams.append('qid', qid);
            }
            // if (aid == null) {
            //     aid = Math.floor(Math.random() * alist.length);
            //     url.searchParams.append('aid', aid);
            // }
            if (apid == null) {
                apid = Math.floor(Math.random() * alist.length);
                url.searchParams.append('apid', apid);
            }
            window.history.pushState("", "", url.href);

            document.getElementById('q').innerHTML = qlist[qid].q;
            document.getElementById('srclnk').href = qlist[qid].srclnk;
            document.getElementById('src').innerHTML = qlist[qid].src;
            
            document.getElementById('art').src = alist[apid].art;
            // document.getElementById('artlnk').href = alist[apid].artlnk;
        }
        </script>
    </p>
</div>
<script type="text/javascript">
function newQuestion() {
    qid = Math.floor(Math.random() * qlist.length);
    // aid = Math.floor(Math.random() * alist.length);
    apid = Math.floor(Math.random() * alist.length);

    document.getElementById('q').innerHTML = qlist[qid].q;
    document.getElementById('srclnk').href = qlist[qid].srclnk;
    document.getElementById('src').innerHTML = qlist[qid].src;

    document.getElementById('art').src = alist[apid].art;
    // document.getElementById('artlnk').href = alist[apid].artlnk;

    var url_string = window.location.href;
    var url = new URL(url_string);
    url.searchParams.set('qid', qid);
    // url.searchParams.set('aid', aid);
    url.searchParams.set('apid', apid);
    window.history.pushState("", "", url.href);

}
</script>
<!-- <a name="artlnk" id="artlnk" href="../art.html"><img name = "art" id="art" src="https://www.cc.gatech.edu/~parikh/static/strokes/1.png" alt="art" height="250" class="center"></a>
        <br><br>
        <font class = "question" name="q" id="q"> What surprises you the most about this world?</font> 
        <br><br><br>
         <a href="../"><font class = "source" name="src" id="src" > &mdash; Devi Parikh</font></a> -->