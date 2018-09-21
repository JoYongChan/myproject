package com.naver.project;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.naver.project.entities.Board;
import com.naver.project.entities.BoardPaging;
import com.naver.project.entities.Comment;
import com.naver.project.service.BoardDao;
import com.naver.project.service.CommentDao;

@Controller
public class BoardController {
	@Autowired
	private SqlSession sqlSession;
	@Autowired
	private Board board;
	@Autowired
	private Comment comment;
	@Autowired
	private BoardPaging boardpaging; 
	static String find;
	@RequestMapping(value = "/boardInsertForm", method = RequestMethod.GET)
	public String boardInsertForm(Model model) {
		return "board/board_insert_form";
	}
	
	@RequestMapping(value = "imageUpload", method = RequestMethod.POST)
    public void communityImageUpload(HttpServletRequest request, HttpServletResponse response, @RequestParam MultipartFile upload) {
        OutputStream out = null;
        PrintWriter printWriter = null;
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        try{
            String fileName = upload.getOriginalFilename();
            byte[] bytes = upload.getBytes();
            String uploadPath = "C:Users/IT/Desktop/sourcetree/project/src/main/webapp/resources/cheditoruploads" + fileName;//������
            out = new FileOutputStream(new File(uploadPath));
            out.write(bytes);
            String callback = request.getParameter("CKEditorFuncNum");
            printWriter = response.getWriter();
            String fileUrl = "resources/cheditoruploads/" + fileName;//url���
            printWriter.println("<script type='text/javascript'>window.parent.CKEDITOR.tools.callFunction("
                    + callback
                    + ",'"
                    + fileUrl
                    + "','�̹����� ���ε� �Ͽ����ϴ�.'"
                    + ")</script>");
            printWriter.flush();
        }catch(IOException e){
            e.printStackTrace();
        } finally {
            try {
                if (out != null) {
                    out.close();
                }
                if (printWriter != null) {
                    printWriter.close();
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return;
    }
	@RequestMapping(value = "/boardInsert", method = RequestMethod.POST)
	public String boardInsert(Model model, @ModelAttribute Board board, @RequestParam CommonsMultipartFile file
								,HttpServletRequest request) {

		String originalname = file.getOriginalFilename();
		String realpath = "resources/uploadfiles/";
		String path = "D:/ncs4lastproject/project/src/main/webapp/resources/uploadfiles/";
		String filetime = System.currentTimeMillis()+"";
		if(!originalname.equals("")) {
			try {
				byte bytes[] = file.getBytes();
				BufferedOutputStream output = 
						new BufferedOutputStream(new FileOutputStream(path + filetime+"_"+originalname));
				output.write(bytes);
				output.flush();
				output.close();
				board.setB_attach(realpath+filetime+"_"+originalname);
			} catch (Exception e) {
				System.out.println("file err:"+e.getMessage());
			}
		}
		Date date = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		board.setB_date(format.format(date));
		board.setB_ip(request.getRemoteAddr());
		BoardDao boarddao = sqlSession.getMapper(BoardDao.class);
		boarddao.insertRow(board);
		return "redirect:boardPageList";
	}
	@RequestMapping(value = "/boardUpdate", method = RequestMethod.POST)
	public String boardUpdate(Model model, @ModelAttribute Board board, @RequestParam CommonsMultipartFile file
								) {
		
		BoardDao dao = sqlSession.getMapper(BoardDao.class);
		String originalname = file.getOriginalFilename();
		String realpath = "resources/uploadfiles/";
		String path = "D:/ncs4lastproject/project/src/main/webapp/resources/uploadfiles/";
		String filetime = System.currentTimeMillis()+"";
		System.out.println("before:"+board.getB_attach());
		System.out.println("originalname:"+originalname);
		if(!originalname.equals("")) {
			try {
				byte bytes[] = file.getBytes();
				BufferedOutputStream output = 
						new BufferedOutputStream(new FileOutputStream(path + filetime+"_"+originalname));
				output.write(bytes);
				output.flush();
				output.close();
				board.setB_attach(realpath+filetime+"_"+originalname);
			} catch (Exception e) {
				System.out.println("file err:"+e.getMessage());
			}
		}else {
			board.setB_attach(board.getB_beforeattach());
		}
		Date date = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		board.setB_date(format.format(date));
		dao.updateRow(board);
			
		
		return "redirect:boardPageList";
	}
	@RequestMapping(value = "/boardPageList", method = RequestMethod.GET)
	public String boardPageList(Model model,String find) {
		if(find==null) find = "";
		this.find = find;
		int pagesize = 10;
		int startrow = 0;
		int endrow = startrow + pagesize;
		BoardDao dao = sqlSession.getMapper(BoardDao.class);
		boardpaging.setFind(find);
		boardpaging.setStartrow(startrow);
		boardpaging.setEndrow(endrow);
		ArrayList<Board> boards = dao.pageList(boardpaging);
		int rowcount= dao.selectRowCount(find);
		int absPage =1;
		if(rowcount % pagesize == 0)
			absPage = 0;
		int pageCount = rowcount / pagesize + absPage;
		int[] pages = new int[pageCount];
		for(int i = 0; i<pageCount ; i++) {
			pages[i] = i+1;
		}
		model.addAttribute("boards",boards);
		model.addAttribute("pages",pages);
		return "board/board_page_list";
	}
	@RequestMapping(value = "/boardPageListSelected", method = RequestMethod.GET)
	public String boardPageListSelected(Model model,int page) {
		BoardDao dao = sqlSession.getMapper(BoardDao.class);
		int pagesize = 10;
		int startrow = (page - 1) * pagesize;
		int endrow = pagesize;
		boardpaging.setFind(find);
		boardpaging.setStartrow(startrow);
		boardpaging.setEndrow(endrow);
		ArrayList<Board> boards = dao.pageList(boardpaging);
		int rowcount= dao.selectRowCount(find);
		int absPage =1;
		if(rowcount % pagesize == 0)
			absPage = 0;
		int pageCount = rowcount / pagesize + absPage;
		int[] pages = new int[pageCount];
		for(int i = 0; i<pageCount ; i++) {
			pages[i] = i+1;
		}
		model.addAttribute("boards",boards);
		model.addAttribute("pages",pages);
		return "board/board_page_list";
	}
	@RequestMapping(value = "/boardDetail", method = RequestMethod.GET)
	public String boardDetail(Model model,@ModelAttribute Comment comment,HttpSession session, @RequestParam int b_seq) {
		BoardDao dao = sqlSession.getMapper(BoardDao.class);
		 CommentDao commentdao = sqlSession.getMapper(CommentDao.class);
		Board board = dao.selectOne(b_seq);
		if(!board.getB_email().equals(session.getAttribute("sessionemail"))) {
			dao.updateHit(b_seq);
		}	
//		System.out.println("session"+session.getAttribute("sessionemail"));
		model.addAttribute("board",board);
		return "board/board_detail";
	}
	@RequestMapping(value = "/boardDownload", method = RequestMethod.GET)
	 public ModelAndView boardDownload(@RequestParam String b_attach) {
		String path="D:/ncs4lastproject/project/src/main/webapp/";
		System.out.println("========>>>>>"+b_attach);
	  File file = new File(path+b_attach); 
	  return new ModelAndView("download","downloadFile",file);
	 }
	
	@RequestMapping(value = "/boardReplyForm", method = RequestMethod.GET)
	public String boardReplyForm(Model model,HttpSession session, @RequestParam int b_seq, String b_title) {
		board.setB_email((String) session.getAttribute("sessionemail"));
		board.setB_name((String) session.getAttribute("sessionname"));
		board.setB_seq(b_seq);
		board.setB_title("[���]"+b_title);
		model.addAttribute("board",board);
		System.out.println("----->>>title:::"+b_title);
		return "board/board_reply_form";
	}
	@RequestMapping(value = "/boardReplyInsert", method = RequestMethod.POST)
	public String boardReplyInsert(Model model, @ModelAttribute Board board, @RequestParam CommonsMultipartFile file
								,HttpServletRequest request) {

		String originalname = file.getOriginalFilename();
		String realpath = "resources/uploadfiles/";
		String path = "D:/ncs4lastproject/project/src/main/webapp/resources/uploadfiles/";
		String filetime = System.currentTimeMillis()+"";
		if(!originalname.equals("")) {
			try {
				byte bytes[] = file.getBytes();
				BufferedOutputStream output = 
						new BufferedOutputStream(new FileOutputStream(path + filetime+"_"+originalname));
				output.write(bytes);
				output.flush();
				output.close();
				board.setB_attach(realpath+filetime+"_"+originalname);
			} catch (Exception e) {
				System.out.println("file err:"+e.getMessage());
			}
		}
		Date date = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		board.setB_date(format.format(date));
		board.setB_ip(request.getRemoteAddr());
		BoardDao dao = sqlSession.getMapper(BoardDao.class);
		dao.insertReplyRow(board);
		return "redirect:boardPageList";
	}
	@RequestMapping(value = "/boardDelete", method = RequestMethod.GET)
		public String boardDelete(@RequestParam int b_seq,@RequestParam int b_ref) {
			BoardDao dao = sqlSession.getMapper(BoardDao.class);
			if(b_seq == b_ref) {
				dao.deleteRowref(b_ref);
			}else {
				dao.deleteRowseq(b_seq);
			}
			return "redirect:boardPageList";
		}
	 @RequestMapping(value = "/commentInsert", method = RequestMethod.POST)
	    @ResponseBody
	    public String commentInsert(@ModelAttribute Comment comment, @RequestParam String content,@RequestParam int b_seq) {
		 	System.out.println("commentInsert");
	        try{
	        	Date date = new Date();
	    		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
	    		comment.setReg_date(format.format(date));
	        	comment.setWriter("test"); 
	        	comment.setB_code(b_seq);
	    		CommentDao commentdao = sqlSession.getMapper(CommentDao.class);
	    		commentdao.insertRow(comment);
	    		
	        } catch (Exception e){
	        	System.out.println("message==============>>>>"+e.getMessage());
	            e.printStackTrace();
	        }
	        
	        return "success";
	    }
	 @RequestMapping(value="/commentList", produces="application/json; charset=utf8",method = RequestMethod.GET)
	    @ResponseBody
	    public ResponseEntity commentList(Model model,@ModelAttribute Comment comment,@RequestParam int b_code){
	        HttpHeaders responseHeaders = new HttpHeaders();
	        ArrayList<HashMap> hmlist = new ArrayList<HashMap>();
	        CommentDao dao = sqlSession.getMapper(CommentDao.class);
			ArrayList<Comment> comments = dao.selectOne(b_code);
	        if(comments.size() > 0){
	            for(int i=0; i<comments.size(); i++){
	                HashMap hm = new HashMap();
	                hm.put("c_code", comments.get(i).getC_code());
	                hm.put("content", comments.get(i).getContent());
	                hm.put("writer", comments.get(i).getWriter());
	                hmlist.add(hm);
	            }
	        }
	        JSONArray json = new JSONArray(hmlist);        
	        return new ResponseEntity(json.toString(), responseHeaders, HttpStatus.CREATED);
	        
	    }
		@RequestMapping(value = "/commentDelete", method = RequestMethod.GET)
		@ResponseBody
		public String commentDelete(@RequestParam int c_code, @ModelAttribute Comment comment) {
			CommentDao dao = sqlSession.getMapper(CommentDao.class);
				dao.commentDelete(c_code);
			return "success";
		}

	
}
