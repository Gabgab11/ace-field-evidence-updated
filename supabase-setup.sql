-- Create projects table
CREATE TABLE projects (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  user_id UUID REFERENCES auth.users(id) ON DELETE CASCADE NOT NULL,
  name TEXT NOT NULL,
  description TEXT,
  latitude DECIMAL(10, 6) NOT NULL,
  longitude DECIMAL(10, 6) NOT NULL,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Create records table
CREATE TABLE records (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  user_id UUID REFERENCES auth.users(id) ON DELETE CASCADE NOT NULL,
  project_id UUID REFERENCES projects(id) ON DELETE CASCADE NOT NULL,
  measurement_type TEXT NOT NULL,
  value DECIMAL(10, 2) NOT NULL,
  notes TEXT,
  data_hash TEXT NOT NULL,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Create indexes
CREATE INDEX idx_projects_user_id ON projects(user_id);
CREATE INDEX idx_records_user_id ON records(user_id);
CREATE INDEX idx_records_project_id ON records(project_id);

-- Enable Row Level Security
ALTER TABLE projects ENABLE ROW LEVEL SECURITY;
ALTER TABLE records ENABLE ROW LEVEL SECURITY;

-- Create policies for projects
CREATE POLICY "Users can view their own projects"
  ON projects FOR SELECT
  USING (auth.uid() = user_id);

CREATE POLICY "Users can insert their own projects"
  ON projects FOR INSERT
  WITH CHECK (auth.uid() = user_id);

CREATE POLICY "Users can update their own projects"
  ON projects FOR UPDATE
  USING (auth.uid() = user_id);

CREATE POLICY "Users can delete their own projects"
  ON projects FOR DELETE
  USING (auth.uid() = user_id);

-- Create policies for records
CREATE POLICY "Users can view their own records"
  ON records FOR SELECT
  USING (auth.uid() = user_id);

CREATE POLICY "Users can insert their own records"
  ON records FOR INSERT
  WITH CHECK (auth.uid() = user_id);

CREATE POLICY "Users can update their own records"
  ON records FOR UPDATE
  USING (auth.uid() = user_id);

CREATE POLICY "Users can delete their own records"
  ON records FOR DELETE
  USING (auth.uid() = user_id);
