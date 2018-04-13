$(function(){
	$('#btnSignIn').click(function(){
		
		$.ajax({
			url: '/validateLogin',
			data: $('form').serialize(),
			type: 'POST',
			success: function(response){
				console.log(response);
			},
			error: function(error){
				console.log(error);
			}
		});
	});
	/*
	use dnd;

DROP PROCEDURE `getClassAbilities`;

DELIMITER $$
CREATE PROCEDURE `getClassAbilities`(
    IN p_user_id INT,
    IN p_class_name VARCHAR(50),
    IN p_level INT
)
BEGIN
    if ( select exists (select 1 from class_level where user_id = p_user_id AND class_name = p_class_name)) THEN
     
        select class_abilities FROM class_level WHERE user_id = p_user_id AND class_name = p_class_name AND class_level = p_level;
    ELSE
		SELECT class_abilities FROM class_level WHERE user_id = 1 AND class_name = p_class_name AND class_level = p_level;
    END IF;
END$$
DELIMITER ;

CALL getRaceAbilities(2, 'Dragonborn')

DELIMITER $$
CREATE PROCEDURE `getRaceAbilities`(
    IN p_user_id INT,
    IN p_race_name VARCHAR(50)
)
BEGIN
    IF (SELECT EXISTS (SELECT 1 FROM race WHERE user_id = p_user_id AND race_name = p_race_name)) THEN
		SELECT race_abilities FROM race WHERE user_id = p_user_id AND race_name = p_race_name;
	ELSE
		SELECT race_abilities FROM race WHERE user_id = 1 AND race_name = p_race_name;
	END IF;
END$$
DELIMITER ;
	*/
});