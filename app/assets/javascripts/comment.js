class Comment {	
  constructor({name, user_id, candy_id}) {
    this.name = name    
    this.user_id = user_id
    this.candy_id = candy_id
  };
}
Comment.prototype.getComments = () => {
  return this.name + this.user_id
}
  
