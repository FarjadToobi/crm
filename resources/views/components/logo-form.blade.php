<h4>Creative</h4>
<div class="form-row">
    <input type="hidden" name="service" id="service" value="logoservice" />
    <div class="col-md-4">
        <x-input name="title" label="Logo Name" type="text" placeholder="KFC" value="{{  $title  }}" />
    </div>
    <div class="col-md-4">
        <x-input name="logo_slogan" label="Slogan" type="text" placeholder="Taste Delight" value="{{  $slogan  }}" />
    </div>
    
    <div class="col-md-12">
        <x-input name="imagery" label="Imagery" type="text" placeholder="what imagery, if any, should be included in the logo?" value="{{  $imagery  }}"  />
    </div>
    <div class="col-md-12">
        <x-input name="desired_design" label="Desired Design" type="text" placeholder="include reference images, if applicable" value="{{  $design  }}"  />
    </div>
    <div class="col-md-12">
        <x-input name="colors_visual" label="Color & Visual" type="text" placeholder="colors & othter visual considerations" value="{{  $colors  }}"  />
    </div>
    <div class="col-md-12">
        <x-input name="intended_use" label="Intended Use" type="text" placeholder="signage, business cards, etc. " value="{{  $intended  }}"  />
    </div>
    
</div>
<hr>
<h4>Business Information</h4>
<div class="form-row">                
    <div class="col-md-12">
        <x-text-area name="business_overview" label="Business Overview" placeholder="what do you do? what is unique about your business? ">{{  $business  }}</x-text-area>
    </div>

    <div class="col-md-12">
        <x-text-area name="target_audience" label="Target Audience" placeholder="who are you trying to reach? ">{{  $audience  }}</x-text-area>
    </div>
</div>
