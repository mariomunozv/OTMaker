
scaffold:
	# Your scaffold here
		rails g scaffold organization \
			name:string \
			address:string \
			phone:integer \
			user:references;

		rails g scaffold participation \
			user:references \
			organization:references \
			role:string;


		rails g scaffold notification_type \
			name:string \
			template:string;

		rails g scaffold notification \
			user:references \
			work_order:references \
			detail:string \
			status:string \
			notification_type:references;

		rails g scaffold bill_order \
			folio:integer \
			issued:date \
			status:string;

		rails g scaffold work_order \
			code:string \
			title:string \
			description:string \
			user:references \
			organization:references \
			bill_order:references;

		rails g scaffold change \
			work_order:references \
			user:references \
			code:string \
			title:string \
			description:string \
			bill_order:references;

		rails g scaffold comment \
			work_order:references \
			user:references \
			content:string;

	

destroy:
	# Your destroy here
		rails destroy scaffold organization 
		rails destroy scaffold participation
		rails destroy scaffold notification
		rails destroy scaffold notification_type
		rails destroy scaffold bill_order
		rails destroy scaffold work_order
		rails destroy scaffold change
		rails destroy scaffold comment

migrate:
	rake db:drop:all
	rake db:create
	rake db:migrate
	rake db:seed

redo: destroy scaffold migrate
	rails s
