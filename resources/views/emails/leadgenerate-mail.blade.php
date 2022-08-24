@component('mail::message', ['details' => $details])
# Introduction

<p>{{$details['name']}}</p>
@component('mail::button', ['url' => ''])
Button Text
@endcomponent

Thanks,<br>
{{ config('app.name') }}
@endcomponent
