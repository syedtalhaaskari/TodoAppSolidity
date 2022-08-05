// SPDX-License-Identifier: MIT
pragma solidity ^0.8.15; 

// Made by Syed Talha Askari

contract TodoApp {
    struct Todo {
        string todoText;
        bool isComplete;
    }

    mapping(address => Todo[]) private Todos;

    function getTodos() view public returns(Todo[] memory todos) {
        return Todos[msg.sender];
    }

    function getSpecificTodo(uint todoId) view public returns(Todo memory todo) {
        return Todos[msg.sender][todoId];
    }

    function setTodo(string calldata todoText, bool isComplete) public {
        Todos[msg.sender].push(Todo(todoText, isComplete));
    }

    function updateTodoText(uint todoId, string calldata todoText) public {
        Todos[msg.sender][todoId] = Todo(todoText, Todos[msg.sender][todoId].isComplete);
    }

    function toggleTodoComplete(uint todoId) public {
        Todos[msg.sender][todoId] = Todo(Todos[msg.sender][todoId].todoText, !Todos[msg.sender][todoId].isComplete);
    }

    function deleteTodo(uint todoId) public {
        delete Todos[msg.sender][todoId];
    }

    function deleteAllTodos() public {
        delete Todos[msg.sender];
    }
}