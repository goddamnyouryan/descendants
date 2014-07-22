class CreateContents < ActiveRecord::Migration
  def change
    create_table :contents do |t|
      t.text :about_headline
      t.text :about_body
      t.text :joinery_headline
      t.text :joinery_body

      t.timestamps
    end
    Content.create(
      about_headline: 'THIS IS WHERE WE’RE SUPPOSED TO LIST ALL THE SUPER BORING AND FRANKLY NARCISSISTIC INFORMATION ABOUT OUR COMPANY, USING TERMS LIKE “PUSHING THE ENVELOPE” AND “OUTSIDE THE BOX”, FOLLOWED BY A LIST OF ARBITRARY INDUSTRY AWARDS... BUT NOBODY WANTS TO READ THAT. AND WE DON’T WANT TO WRITE IT.',
      about_body: 'So here’s all you need to know: DESCENDANTS is a production company based in Toronto and LA. We’re turned on by smart ideas and will work with you to scale them to any budget. Our roster consists largely of hungry young filmmakers guided by a team of skilled & highly awarded directors/producers. We mine for creative gems, be they in broadcast commercials, TV, feature films or digital, and whatever comes next.',
      joinery_headline: 'This is the headline for the joinery',
      joinery_body: 'This is the about copy for the joinery. edit me!'
    )
  end
end
