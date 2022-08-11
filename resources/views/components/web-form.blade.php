<h4>Project Overview</h4>
            <div class="form-row">
                <input type="hidden" name="service" id="service" value="webservice" />
                <div class="col-md-6">
                    <x-input name="title" label="Website Title" type="text" placeholder="website title" value="{{ $title  }}"  />
                </div>
                <div class="col-md-6">
                    <x-input name="purpose" label="Purpose" type="text" placeholder="why would you like a new website?" value="{{  $purpose  }}"  />
                </div>
                <div class="col-md-12">
                    <x-input name="objective" label="Objective" type="text" placeholder="ultimate impact?  i.e. sales, lead generation, traffic, online presence, etc. " value="{{  $objective  }}"  />
                </div>
            </div>
            <hr>
            <h4>Target Audience</h4>
            <div class="form-row">
                <div class="col-md-12">
                    <x-input name="project_target" label="Project Target" type="text" placeholder="why would you like a new website?" value="{{  $projecttarget  }}"  />
                </div>
                <div class="col-md-12">
                    <x-input name="brand_target" label="Brand Target" type="text" placeholder="who does the brand speak to?" value="{{  $brandtarget  }}"  />
                </div>
                <div class="col-md-12">
                    <x-input name="desired_reaction" label="Desired Reaction" type="text" placeholder="what actions do you wish your market to take?" value="{{  $desiredreaction  }}"  />
                </div>
            </div>
            <hr>
            <h4>Competative Analysis</h4>
            <div class="form-row">
                <div class="col-md-12">
                    <x-input name="competitor" label="Market / Niche Competitor Sites" type="text" placeholder="provide links to competitor sites and other important sites in your industry" value="{{  $competitor  }}"  />
                </div>
                <div class="col-md-12">
                    <x-input name="design" label="Design" type="text" placeholder="provide links / explanations of design elements of websites you like" value="{{  $design  }}"  />
                </div>
                <div class="col-md-12">
                    <x-input name="functionality" label="Funcationlity" type="text" placeholder="provide links / explanations of the functionality of websites you like" value="{{  $functionality  }}"  />
                </div>
            </div>
            <hr>
            <h4>Current Website Review <small>(fill this form if you have current website)</small></h4>
            <div class="form-row">                
                <div class="col-md-12">
                    <x-input name="positive_aspects" label="Positive Aspects" type="text" placeholder="List positive aspects of current site" value="{{  $positiveaspects  }}"  />
                </div>
                <div class="col-md-12">
                    <x-input name="negative_aspects" label="Negative Aspects" type="text" placeholder="List negative aspects of current site" value="{{  $negativeaspects  }}"  />
                </div>
                <div class="col-md-12">
                    <x-input name="traffic_levels" label="Traffic" type="text" placeholder="Current traffic levels" value="{{  $trafficlevels  }}"  />
                </div>
                <div class="col-md-12">
                    <x-input name="current_performance" label="Performance" type="text" placeholder="Current performance levels" value="{{  $currentperformance  }}"  />
                </div>
                <div class="col-md-12">
                    <x-input name="currrent_hosting" label="Hosting" type="text" placeholder="Current host and hosting package" value="{{  $currrenthosting  }}"  />
                </div>
                <div class="col-md-12">
                    <x-input name="negative_hosting" label="Negative Aspects of Hosting" type="text" placeholder="List any negative aspects of current hosting environment" value="{{  $negativehosting  }}"  />
                </div>
            </div>