class ApiV1::MessagesController < ApiController
   def index
+    @messages = Message.all
+  end
end