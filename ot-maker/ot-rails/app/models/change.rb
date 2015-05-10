class Change < ActiveRecord::Base
	include Filterable
	include Importable
	include Exportable

	self.per_page = 10

	  		belongs_to :work_order
	  		belongs_to :user
	  		belongs_to :user_assigned, :class_name => 'User', :foreign_key => 'user_assigned_id'
	  		belongs_to :bill_order
		
	# Validations
			validates :work_order, :presence => true
			validates :user, :presence => true
			validates :code, :presence => true
			validates :title, :presence => true
			validates :description, :presence => true
			validates :state, :presence => true
			# validates :bill_order, <validations>
	
	# Scopes (used for search form)
	#   To search by full text use { where("attribute like ?", "%#{attribute}%") }
	#   To search by string use { where attribute: attribute }
		scope :work_order, -> (work_order_name) { where("work_order.name like ?", "%#{work_order_name}%") }
		scope :user, -> (user_name) { where("user.name like ?", "%#{user_name}%") }
		scope :code, -> (code) { where code: code }
		scope :title, -> (title) { where title: title }
		scope :description, -> (description) { where description: description }
		scope :bill_order, -> (bill_order_folio) { where("bill_order.folio like ?", "%#{bill_order_folio}%") }
	
	# Retorna el class segun el estado
	def class_timeline
		if self.state==0
      	return "info"
    elsif self.state==4
  		return "success"
  	elsif self.state==2
      	return "success"
    elsif self.state==6
      	return "danger"
    elsif self.state==5
      	return "danger-circle"
    elsif self.state >= 10
        return "info"
    else
    	return "warning"
    end
	end

	# Retorna el class del glyphicons segun el estado
	def class_glyphicon
		if self.state==0
      	return "plus"
    elsif self.state==4
  		return "usd"
  	elsif self.state==2
      	return "ok"
    elsif self.state==6
      	return "remove"
    elsif self.state==5
      	return "ban-circle"
    elsif self.state >= 10
        return "repeat"
    else
    	return "refresh"
    end
	end

	def title_timeline
		if self.state==0
      	return "Creado: "+self.title
    elsif self.state==4
  		return "Facturado: "+self.title
  	elsif self.state==2
      	return "Aceptado: "+self.title
    elsif self.state==6
      	return "Rechazado: "+self.title 
    elsif self.state==5
      	return "Removido de Factura: "+self.title
    elsif self.state >= 10
        return "Restaurado a la fecha "+self.created_at.to_s
    else
    	return "Modificado: "+self.title
    end
	end

	def diference_time
		a= (Time.now - self.created_at)
  	if a< 3600
  		return (a/60).round().to_s+" minutes ago"
  	end
  	if a >= 3600 && a<82800
  		return (a/3600).round().to_s+" hours ago"
  	end
  	if a >= 82800
  		return (a/86400).round().to_s+" days ago"
  	end
	end

	def show_state
		if self.state==0 || self.state==1
      	return "Pendiente"
    elsif self.state==4
  		return "Facturado"
  	elsif self.state==2 || self.state == 3 || self.state == 5
      	return "Aceptado"
    elsif self.state==6
      	return "Rechazado"
    else
        if self.state%10 == 0 || self.state%10==1
            return "Pendiente"
        elsif self.state%10==4
          return "Facturado"
        elsif self.state%10==2 || self.state%10 == 3 || self.state%10 == 5
            return "Aceptado"
        elsif self.state%10==6
            return "Rechazado"
        end
    end
	end

end
