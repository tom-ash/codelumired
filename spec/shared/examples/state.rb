shared_examples 'state' do |person|
  it "status", :status do
    subject
    expect(response.status).to eq(eval("#{person}_status"))
  end

  it 'state & meta', :state_and_meta do
    subject
    expect(body).to eq({
      state: eval("#{person}_state"),
      meta: meta,
    })
  end
  
  describe 'state', person.to_sym do
    it 'state', :state do
      subject
      expect(body[:state]).to eq(eval("#{person}_state"))
    end

    it 'app', :app do
      subject
      expect(body[:state][:app]).to eq(eval("#{person}_app_data"))
    end

    it 'render', :render do
      subject
      expect(body[:state][:render]).to eq(eval("#{person}_render"))
    end

    it 'user_state', :user_state do
      subject
      expect(body[:state][:user]).to eq(eval("#{person}_user"))
    end

    it 'control', :control do
      subject
      expect(body[:state][:control]).to eq(eval("#{person}_control"))
    end

    it 'assets', :assets do
      subject
      expect(body[:state][:assets]).to eq(eval("#{person}_assets"))
    end

    it 'links', :links do
      subject
      expect(body[:state][:links]).to eq(eval("#{person}_links"))
    end

    it 'texts', :texts do
      subject
      expect(body[:state][:texts]).to eq(eval("#{person}_texts"))
    end

    it 'data', :data do
      subject
      expect(body[:state][:data]).to eq(eval("#{person}_data"))
    end

    it 'inputs', :inputs do
      subject
      expect(body[:state][:inputs]).to eq(eval("#{person}_inputs"))
    end

    it 'errors', :errors do
      subject
      expect(body[:state][:errors]).to eq({})
    end
  end

  describe 'meta', person.to_sym do
    it 'meta', :meta do
      subject
      expect(body[:meta]).to eq(meta)
    end

    it 'schemaOrg', :schemaOrg do
      subject
      expect(body[:meta][:schemaOrg]).to eq(schemaOrg)
    end

    it 'openGraph', :openGraph do
      subject
      expect(body[:meta][:openGraph]).to eq(openGraph)
    end
  end
end
