helpers do
  def get_enemy
    if (Character.find_by(char_type: "enemy") == nil)
      enemy = Character.create(name: generate_name, char_type: "enemy", health: (rand(95..110)), attack: "5-10", defense: (rand(0..1)), level: 7, picture_id: generate_enemy_picture, message: "I'm the Real Revenger!", special1: "Quick Attack", special1dmg: (rand(11..15)), special2: "Body Slam",special2dmg: (rand(15..20)))
    else
      enemy = Character.find_by(char_type: "enemy")
    end
  end

  def get_strong_enemy
    if (Character.find_by(char_type: "enemy") == nil)
      enemy = Character.create(name: generate_name, char_type: "enemy", health: (rand(100..120)), attack: "8-12", defense: (rand(0..2)), level: 8, picture_id: generate_enemy_picture, message: "I'm the Real Revenger!", special1: "Body Slam", special1dmg: (rand(15..20)), special2: "Hyper Beam",special2dmg: (rand(20..30)))
    else
      enemy = Character.find_by(char_type: "enemy")
    end
  end

  def death
    (session[:hp] <= 0 || session[:enemyhp] <= 0)
  end

  def bar_color
    if (session[:hp]<20)
      return "danger"
    elsif (session[:hp]<50)
      return "warning"
    else
      return "success"
    end
  end

  def enemy_bar_color
    if (session[:enemyhp]<20)
      return "danger"
    elsif (session[:enemyhp]<50)
      return "warning"
    else
      return "success"
    end
  end

  def get_enemy_avatar
    Character.find(get_enemy).picture_id
  end

  def find_enemy
    Character.find_by(char_type: "enemy")
  end

  def destroy_enemy
      if (find_enemy != nil)
        find_enemy.destroy
      else
        return nil
      end
  end

  def generate_enemy_picture
    first = (rand(1..151).to_s)
    second = (rand(1..151).to_s)
    url = "images.alexonsager.net/pokemon/fused/"+first+"/"+first+"."+second+".png"
    return url
  end

  def attack_total
    @hero = get_current_hero
    enemy_for_attacks
    @yourdmg = (find_damage(@hero.attack) - @enemy.defense)
    @enemydmg = (find_damage(@enemy.attack) - @hero.defense)
    if @enemydmg < 0
      @enemydmg = 0
    end
    if @yourdmg < 0
      @yourdmg = 0
    end
    session[:edmg] = @enemydmg
    session[:dmg] = @yourdmg
    session[:hp] -= @enemydmg
    session[:enemyhp] -= @yourdmg
    set_hp
  end

  def heal_total
    @hero = get_current_hero
    enemy_for_attacks
    num = rand(0..100)
    if (num<=25)
      session[:hp] += 25
      session[:dmg] = 25
    else
      session[:dmg] = 0
    end
    @enemydmg = (find_damage(@enemy.attack) - @hero.defense)
    if @enemydmg < 0
      @enemydmg = 0
    end
    session[:edmg] = @enemydmg
    session[:hp] -= @enemydmg
    set_hp
  end

  def special_attack_total
    @hero = get_current_hero
    enemy_for_attacks
    num = rand(0..100)
    if (num<=40)
      @yourdmg = (@hero.special1dmg - @enemy.defense)
    else
      @yourdmg = 0
    end
    @enemydmg = (find_damage(@enemy.attack) - @hero.defense)
    if @enemydmg < 0
      @enemydmg = 0
    end
    session[:edmg] = @enemydmg
    session[:dmg] = @yourdmg
    session[:hp] -= @enemydmg
    session[:enemyhp] -= @yourdmg
    set_hp
  end

  def special2_attack_total
    @hero = get_current_hero
    enemy_for_attacks
    num = rand(0..100)
    if (num<=25)
      @yourdmg = (@hero.special2dmg - @enemy.defense)
    else
      @yourdmg = 0
    end
    @enemydmg = (find_damage(@enemy.attack) - @hero.defense)
    if @enemydmg < 0
      @enemydmg = 0
    end
    session[:edmg] = @enemydmg
    session[:dmg] = @yourdmg
    session[:hp] -= @enemydmg
    session[:enemyhp] -= @yourdmg
    set_hp
  end

  def set_hp
    if (session[:hp] < 0)
      session[:hp] = 0
    end
    if (session[:enemyhp] < 0)
      session[:enemyhp] = 0
    end
  end

  def find_damage(damage_range)
    range = damage_range.split("-")
    range1 = range[0].to_i
    range2 = range[1].to_i
    damage = rand(range1..range2)
    return damage
  end

  def map_params
    if (params[:map] == "plain")
      @enemy = get_enemy
      erb :'/battles/plain'
    elsif (params[:map] == "dungeon")
      @enemy = get_enemy
      erb :'/battles/dungeon'
    elsif (params[:map] == "boss")
      @enemy = Character.find_by(id: session[:bossid])
      erb :'/battles/boss'
    end
  end

  def enemy_for_attacks
    if (session[:bossid] != nil)
      @enemy = Character.find_by(id: session[:bossid])
    else
      @enemy = get_enemy
    end
  end

  def generate_name
    @names = ["Filiberto Fabian","Simone Santee","Kiara Kesten","Karoline Kempker","Jerri Judy","Deshawn Diggins","Araceli Arter","Lisandra Lerner","Vida Voss","Violet Vanduyn","Shaunte Sanon","Twila Torrez","Williemae Wimberly","Kecia Kirkendoll","Buffy Boye","Herschel Holliman","Mandi Mcgary","Kati Kolbe","Franchesca Fleeman","Pamula Philipps","Dorothea Das","Abby Amundsen","Kristian Kramp","Francina Fabiano","Walker Warr","Ashlee Aycock","Ericka Ekhoff","Nathan Northcott","Noella Nevitt","Ernest Erbe","Briana Brousseau","Mckenzie Mclelland","Alison Alfieri","Melda Mcglone","Antonina Alligood","Cecile Campagna","Geralyn Gauthier","Annemarie Aybar","Misti Munsell","Thaddeus Tetrault","Janene Jayne","Many Mattia","Charolette Carte","Elia Eber","Merissa Mcgrory","Nancee Newbold","Lauryn Lessard","Lenny Langston","Lashaun Leitner","Lupe Lirette"]
      @names.sample
  end
end