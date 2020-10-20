package com.cos.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cos.board.dto.BoardSaveRequestDto;
import com.cos.board.model.Board;
import com.cos.board.service.BoardService;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	
	//http://localhost:8000/board/saveForm
	@GetMapping("/saveForm")
	public String saveForm() {
		return "saveForm";
	}
	
	@PostMapping("/save")
	@ResponseBody
	public String save(@RequestBody BoardSaveRequestDto dto) {
		System.out.println(dto);
		boardService.글쓰기(dto);
		return "ok";
		
	}
	//스프링에서 controller의 메서드의 파라메터 부분은 자동 di가 됨.
	@GetMapping({"","/","/list"})
	public String list(Model model, @PageableDefault(size = 5, sort = "id", direction = Direction.DESC) Pageable pageable) {
		model.addAttribute("boards",boardService.글목록보기(pageable));
		return "list";
	}
	
	@GetMapping("/list/test")
	@ResponseBody
	public Page<Board> list(@PageableDefault(size = 5, sort = "id", direction = Direction.DESC) Pageable pageable) {

		return boardService.글목록보기(pageable);
	}
	
	@GetMapping("/board/{id}")
	public String detail(@PathVariable int id,Model model) throws Exception {
		//empty Object => orElse
		//Board board = boardRepository.findById(id).orElse(new Board());
		
		//orElseGet
		//Board board = boardRepository.findById(id).orElseGet(() ->new Board());
		
		/*Board board = boardRepository.findById(id).orElseThrow(new Supplier<Exception>() {

				@Override
				public Exception get() {
					// TODO Auto-generated method stub
					return new Exception("오류");
				}
			});
		*/

		model.addAttribute("board",boardService.글상세보기(id));
		return "detail";
	}
	@DeleteMapping("/board/{id}")
	@ResponseBody
	public String delete(@PathVariable int id) {
		boardService.글삭제하기(id);
		return "ok";
	}
	
	@PutMapping("/board/{id}")
	@ResponseBody
	public String update(@PathVariable int id,@RequestBody BoardSaveRequestDto dto) {
		boardService.글수정하기(id,dto);
		return "ok";
	}
	
}
