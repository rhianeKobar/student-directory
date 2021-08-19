@students = []
@months = {
	"january" => :january,
	"february" => :february,
	"march" => :march,
	"april" => :april,
	"may" => :may,
	"june" => :june,
	"july" => :july,
	"august" => :august,
	"september" => :september,
	"october" => :october,
	"november" => :november,
	"decemeber" => :decemeber
} 
def input_students
	puts "Please enter the names of the students"
	puts "To finish, just hit return twice"

	name = gets.chomp
	
	while !name.empty? do
		puts "Please enter cohort month"

		month = gets.chomp

		while !month.empty? do
			if @months[month]
				@students << {name: name, cohort: @months[month]}
				puts "Now we have #{@students.count} students"
			else
				puts "That month doesn't exist, try again"
			end
			puts "Press return or change the month you just entered"
			month = gets.chomp 
		end

		puts "Enter another name or return to finish"
		name = gets.chomp
	end
end

def print_header
	puts "The students of Villains Academy"
	puts "-------------"
end

def print_student_list
	n = 0
	if @students.size > 0
		while n < @students.size do
			str = "#{n + 1}. #{@students[n][:name]} (#{@students[n][:cohort]} cohort)"
			puts str.center(10)
			n += 1
		end
	else
		puts "You have no students yet"
	end
end

def print_footer
	if @students.size > 1
		puts "Overall, we have #{@students.count} great students"
	else
		puts "Overall, we have one great student"
	end
end

def print_cohort
	puts "Please enter the cohort you'd like to see"
	cohort = gets.chomp
	st_hort = []
	@students.map {
		|student|
		if student[:cohort] == months[cohort]
			st_hort.push(student)
			puts "hi"
		end
	}
	print(st_hort)
end

def print_menu
	puts "1. Input the students"
	puts "2. Show the students"
	puts "3. Save the list to students.csv"
	puts "9. exit"
end

def show_students
	print_header
	print_student_list
	print_footer
end

def save_students
	file = File.open("students.csv", "w")
	@students.each do |student|
		student_data = [student[:name], student[:cohort]]
		csv_line = student_data.join(",")
		file.puts csv_line
	end
	file.close
end
def process(selection)
	case selection
		when "1"
			students = input_students
		when "2"
			show_students
		when "3"
			save_students
		when "9"
			exit
		else 
			puts "That is not an option try again"
	end
end

def interactive_menu
	loop do
		print_menu
		process(gets.chomp)
	end
end

interactive_menu