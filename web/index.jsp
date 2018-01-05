<%--
  Created by IntelliJ IDEA.
  User: doula_itc
  Date: 2018-01-05
  Time: 4:16 PM
  To change this template use File | Settings | File Templates.
--%>
<!doctype html>
<html>
<head>
  <title>Long Task Example</title>
  <style type="text/css">
    /* CSS3 Progress Bar based on */
    /* http://www.catswhocode.com/blog/how-to-create-a-kick-ass-css3-progress-bar */

    @-webkit-keyframes animate-stripes {
      to { background-position: 0 0; }
      from { background-position: -200px 0; }
    }

    @-moz-keyframes animate-stripes {
      to { background-position: 0 0; }
      from { background-position: 36px 0; }
    }

    .progress {
      width: 200px;
    }

    .ui-progress-bar {
      position: relative;
      height: 25px;
      padding-right: 2px;
      background-color: #abb2bc;
      -moz-border-radius: 25px;
      -webkit-border-radius: 25px;
      -o-border-radius: 25px;
      -ms-border-radius: 25px;
      -khtml-border-radius: 25px;
      border-radius: 25px;
      background: -webkit-gradient(linear, 50% 0%, 50% 100%, color-stop(0%, #949daa), color-stop(100%, #abb2bc));
      background: -webkit-linear-gradient(#949daa 0%, #abb2bc 100%);
      background: -moz-linear-gradient(#949daa 0%, #abb2bc 100%);
      background: -o-linear-gradient(#949daa 0%, #abb2bc 100%);
      background: -ms-linear-gradient(#949daa 0%, #abb2bc 100%);
      background: linear-gradient(#949daa 0%, #abb2bc 100%);
      -moz-box-shadow: inset 0px 1px 2px 0px rgba(0, 0, 0, 0.5), 0px 1px 0px 0px white;
      -webkit-box-shadow: inset 0px 1px 2px 0px rgba(0, 0, 0, 0.5), 0px 1px 0px 0px white;
      -o-box-shadow: inset 0px 1px 2px 0px rgba(0, 0, 0, 0.5), 0px 1px 0px 0px white;
      box-shadow: inset 0px 1px 2px 0px rgba(0, 0, 0, 0.5), 0px 1px 0px 0px white;
    }
    .ui-progress-bar.transition .ui-progress {
      -moz-transition: width 0.5s ease-in, background-color 0.5s ease-in, border-color 1.5s ease-out, box-shadow 1.5s ease-out;
      -webkit-transition: width 0.5s ease-in, background-color 0.5s ease-in, border-color 1.5s ease-out, box-shadow 1.5s ease-out;
      -o-transition: width 0.5s ease-in, background-color 0.5s ease-in, border-color 1.5s ease-out, box-shadow 1.5s ease-out;
      transition: width 0.5s ease-in, background-color 0.5s ease-in, border-color 1.5s ease-out, box-shadow 1.5s ease-out;
    }

    .ui-progress-bar .ui-progress {
      position: relative;
      display: block;
      overflow: hidden;
      height: 23px;
      -moz-border-radius: 25px;
      -webkit-border-radius: 25px;
      -o-border-radius: 25px;
      -ms-border-radius: 25px;
      -khtml-border-radius: 25px;
      border-radius: 25px;
      -webkit-background-size: 280px 44px;
      -moz-background-size: 36px 36px;
      background-color: #74d04c;
      background: -webkit-linear-gradient(-30deg, rgba(255, 255, 255, 0.17), rgba(255, 255, 255, 0.17) 30px, rgba(255, 255, 255, 0) 30px, rgba(255, 255, 255, 0) 60px, rgba(255, 255, 255, 0.17) 60px, rgba(255, 255, 255, 0.17) 90px, rgba(255, 255, 255, 0) 90px, rgba(255, 255, 255, 0) 120px, rgba(255, 255, 255, 0.17) 120px, rgba(255, 255, 255, 0.17) 150px, rgba(255, 255, 255, 0) 150px, rgba(255, 255, 255, 0) 180px, rgba(255, 255, 255, 0.17) 180px, rgba(255, 255, 255, 0.17) 210px, rgba(255, 255, 255, 0) 210px, rgba(255, 255, 255, 0) 240px, rgba(255, 255, 255, 0.17) 240px, rgba(255, 255, 255, 0.17) 270px, rgba(255, 255, 255, 0) 270px, #74d04c), #74d04c;
      background: -moz-repeating-linear-gradient(top left -30deg, rgba(255, 255, 255, 0.17), rgba(255, 255, 255, 0.17) 15px, rgba(255, 255, 255, 0) 15px, rgba(255, 255, 255, 0) 30px), -moz-linear-gradient(rgba(255, 255, 255, 0.25) 0%, rgba(255, 255, 255, 0) 100%), #74d04c;
      -moz-box-shadow: inset 0px 1px 0px 0px rgba(255, 255, 255, 0.4), inset 0px -1px 1px rgba(0, 0, 0, 0.2);
      -webkit-box-shadow: inset 0px 1px 0px 0px rgba(255, 255, 255, 0.4), inset 0px -1px 1px rgba(0, 0, 0, 0.2);
      -o-box-shadow: inset 0px 1px 0px 0px rgba(255, 255, 255, 0.4), inset 0px -1px 1px rgba(0, 0, 0, 0.2);
      box-shadow: inset 0px 1px 0px 0px rgba(255, 255, 255, 0.4), inset 0px -1px 1px rgba(0, 0, 0, 0.2);
      border: 1px solid #4c8932;
      -moz-animation: animate-stripes 2s linear infinite;
      -webkit-animation: animate-stripes 5s linear infinite;
      -o-animation: animate-stripes 2s linear infinite;
      -ms-animation: animate-stripes 2s linear infinite;
      -khtml-animation: animate-stripes 2s linear infinite;
      animation: animate-stripes 2s linear infinite;
    }

    .ui-progress-bar .ui-progress span.ui-label {
      -moz-font-smoothing: antialiased;
      -webkit-font-smoothing: antialiased;
      -o-font-smoothing: antialiased;
      -ms-font-smoothing: antialiased;
      -khtml-font-smoothing: antialiased;
      font-smoothing: antialiased;
      font-size: 13px;
      position: absolute;
      right: 0;
      line-height: 23px;
      padding-right: 12px;
      color: rgba(0, 0, 0, 0.6);
      text-shadow: rgba(255, 255, 255, 0.45) 0 1px 0px;
      white-space: nowrap;
    }
  </style>
</head>
<body>
<h1>SSE EVENTS</h1>
<a href="#" onclick="startTask(); return false;">Start Long Task</a><br /><br />

<!-- Progress bar adapted from http://www.catswhocode.com/blog/how-to-create-a-kick-ass-css3-progress-bar -->
<div class="progress">
  <div class="ui-progress-bar ui-container transition" id="progress_bar">
    <div id="progress" class="ui-progress" style="width: 0%;">
      <span id="label" class="ui-label"></span>
    </div>
  </div>
</div>

<script type="text/javascript">
    function startTask() {
      /* create the event source */
        var source = new EventSource('/sse/task');
      /* handle incoming messages */
        source.onmessage = function(event) {
            if (event.type == 'message') {
                // data expected to be in JSON-format, so parse */
                var data = JSON.parse(event.data);
                // server sends complete:true on completion
                if (data.complete) {
                    // close the connection so browser does not keep connecting
                    source.close();
                    // update the UI now that task is complete
                    document.getElementById('label').innerHTML = 'Complete';
                }
                // otherwise, it's a progress update so just update progress bar
                else {
                    var pct = 100.0 * data.current / data.total;
                    document.getElementById('progress').style.width = pct + '%';
                    document.getElementById('label').innerHTML = data.current + ' of ' + data.total;
                }
            }
        };
        source.onerror = function(event) {
            console.log('Failed to Start EventSource: ', event);
        };
    }
</script>
</body>
</html>
