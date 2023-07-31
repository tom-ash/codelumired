shared_examples 'state' do |person|
  describe 'state' do
    it "returns specific response status" do
      subject
      expect(response.status).to eq(eval("#{person}_status"))
    end

    it 'includes specific state & specific meta properties in body' do
      subject
      expect(body).to eq({
        state: eval("#{person}_state"),
        meta: meta,
      })
    end

    it 'includes specific state property in body' do
      subject
      expect(body[:state]).to eq(eval("#{person}_state"))
    end

    it 'includes specific app property in state' do
      subject
      expect(body[:state][:app]).to eq(eval("#{person}_app_data"))
    end

    it 'includes specific render property in state' do
      subject
      expect(body[:state][:render]).to eq(eval("#{person}_render"))
    end

    it 'includes specific user property in state' do
      subject
      expect(body[:state][:user]).to eq(eval("#{person}_user"))
    end

    it 'includes specific control property in state' do
      subject
      expect(body[:state][:control]).to eq(eval("#{person}_control"))
    end

    it 'includes specific assets property in state' do
      subject
      expect(body[:state][:assets]).to eq(eval("#{person}_assets"))
    end

    it 'includes specific links property in state' do
      subject
      expect(body[:state][:links]).to eq(eval("#{person}_links"))
    end

    it 'includes specific texts property in state' do
      subject
      expect(body[:state][:texts]).to eq(eval("#{person}_texts"))
    end

    it 'includes specific data property in state' do
      subject
      expect(body[:state][:data]).to eq(eval("#{person}_data"))
    end

    it 'includes specific inputs property in state' do
      subject
      expect(body[:state][:inputs]).to eq(eval("#{person}_inputs"))
    end

    it 'includes specific errors property in state' do
      subject
      expect(body[:state][:errors]).to eq({})
    end

    describe 'meta' do
      it 'includes specific meta property in body' do
        subject
        expect(body[:meta]).to eq(meta)
      end
  
      it 'includes specific schemaOrg property in meta' do
        subject
        expect(body[:meta][:schemaOrg]).to eq(schemaOrg)
      end
  
      it 'includes specific openGraph property in meta' do
        subject
        expect(body[:meta][:openGraph]).to eq(openGraph)
      end
    end
  end
end
