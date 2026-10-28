<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">
            {{ __('Dashboard') }}
        </h2>
    </x-slot>

    <div class="py-12">
        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
            <div class="bg-white overflow-hidden shadow-sm sm:rounded-lg">
                <div class="p-6 text-gray-900">
                    {{ __("You're logged in!") }} Rol: {{ Auth::user()->rol }}
                    <br>
                    @if (Auth::user()->magMagazijnZien())
                        <a href="{{ route('magazijn.overzicht') }}" class="text-blue-600 underline">Overzicht Magazijn Jamin</a>
                        <br>
                        <a href="{{ route('leverancier.overzicht') }}" class="text-blue-600 underline">Overzicht Leveranciers</a>
                    @endif
                </div>
            </div>
        </div>
    </div>
</x-app-layout>
