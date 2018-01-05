package info.doula.api;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.concurrent.Callable;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;

/**
 * Mohammed Hossain Doula
 *
 * @hossaindoula | @itconquest
 * <p>
 * http://hossaindoula.com
 * <p>
 * https://github.com/hossaindoula
 */
@WebServlet("/sse/task")
public class LongTaskServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private ExecutorService executor;

    public LongTaskServlet() {
        super();
    }

    @Override
    public void init(ServletConfig config) throws ServletException {
        this.executor = Executors.newCachedThreadPool();
    }

    /**
     * Handle the GET request by constantly sending SSE events until the task
     * is complete.
     */
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {


        // handle base functionality
        // super.doGet(req, resp);

        // make sure to sent the event source content type and encoding
        resp.setContentType("text/event-stream");
        resp.setCharacterEncoding("UTF-8");

        // start long running task
        // NOTE: this uses threads to spawn tasks which is technically not
        //       allowed by the servlet spec, but it helps to demonstrate the
        //       point.
        LongTask task = new LongTask(10);
        Future<Boolean> result = executor.submit(task);

        // wait until task is complete sending updates as events
        int last = task.getCurrent();
        while (!result.isDone()) {

            if (task.getCurrent() != last) {
                last = task.getCurrent();

                // send the JSON-encoded data
                StringBuilder data = new StringBuilder(128);
                data.append("{\"current\":").append(last).append(",")
                        .append("\"total\":").append(task.getTotal()).append("}\n\n");
                System.out.println("DATA: " + data);
                writeEvent(resp, "status", data.toString());
            }
        }

        // send finalized response
        writeEvent(resp, "status", "{\"complete\":true}");
    }

    /**
     * Write a single server-sent event to the response stream for the given
     * event and message.
     *
     * @param resp  The response to write to
     * @param event  The event to write
     * @param message  The message data to include
     *
     * @throws IOException  If an I/O error occurs
     */
    protected void writeEvent(HttpServletResponse resp,
                              String event, String message) throws IOException {

        // get the writer to send text responses
        PrintWriter writer = resp.getWriter();

        // write the event type (make sure to include the double newline)
        writer.write("event: " + event + "\n\n");

        // write the actual data
        // this could be simple text or could be JSON-encoded text that the
        // client then decodes
        writer.write("data: " + message + "\n\n");

        // flush the buffers to make sure the container sends the bytes
        writer.flush();
        resp.flushBuffer();
    }

    /**
     * This resembles a task that could be used to perform some long running
     * task that executes in a separate thread.  This example just sleeps
     * over and over sending its progress.
     */
    public static class LongTask implements Callable<Boolean> {

        private int current;
        private int total;

        public LongTask(int total) {
            this.total = total;
        }

        public int getCurrent() {
            return this.current;
        }

        public int getTotal() {
            return this.total;
        }

        @Override
        public Boolean call() throws Exception {
            // do stuff (for now just sleep as an example)
            while (++this.current < this.total) {
                try { Thread.sleep(1000); }
                catch (Exception e) { /* ignore */ }
            }

            return Boolean.TRUE;
        }

    }
}
