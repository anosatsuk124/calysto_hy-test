(import os base64 [IPython.display [HTML]])

(defn show [&optional fig [file_ex "svg"]]
      (setv filename_n 0)
      (if (= (os.path.isdir "temp") False)
          (os.mkdir "temp"))
      (while (os.path.isfile (+ (+ "temp/" (str filename_n)) (.format ".{file_ex}" :file_ex file_ex)))
                 (setv filename_n (+ filename_n 1))
             )
      (setv filename (+ (+ "temp/" (str filename_n)) (.format ".{file_ex}" :file_ex file_ex)))
      (fig.savefig filename)
      (with [file (open filename "rb")]
            (setv data (.b64encode base64 (.read file)))
            )
      (setv tag (.format (+(+ "<img src='data:image/{file_ex};base64," (.decode data "utf-8")) "'>") :file_ex file_ex))
      (if (= file_ex "svg")
          (setv tag (+(+ "<img src='data:image/svg+xml;base64," (.decode data "utf-8")) "'>"))
          )
      (return (HTML tag))
       )