<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">
            Levering product
        </h2>
    </x-slot>

    @if ($melding)
        <meta http-equiv="refresh" content="4;url={{ route('leverancier.producten', $info['LeverancierId']) }}">
    @endif

    <div class="py-12">
        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
            <div class="bg-white overflow-hidden shadow-sm sm:rounded-lg p-6">

                <div class="mb-4">
                    <p>Product: {{ $info['NaamProduct'] }}</p>
                    <p>Leverancier: {{ $info['NaamLeverancier'] }}</p>
                    <p>Contactpersoon: {{ $info['ContactPersoon'] }}</p>
                    <p>Mobiel: {{ $info['Mobiel'] }}</p>
                </div>

                @if ($melding)
                    <div class="mb-4 p-3 border border-red-300 bg-red-50 text-red-700 rounded">
                        {{ $melding }}
                    </div>
                @endif

                <form method="POST" action="{{ route('leverancier.levering.opslaan', [$info['LeverancierId'], $info['ProductId']]) }}" class="max-w-md">
                    @csrf

                    <div class="mb-3">
                        <label for="aantal" class="block">Aantal producteenheden</label>
                        <input type="number" id="aantal" name="aantal" min="1" value="{{ old('aantal') }}" required class="w-full border rounded px-2 py-1">
                        @error('aantal')
                            <p class="text-red-600 text-sm">{{ $message }}</p>
                        @enderror
                    </div>

                    <div class="mb-4">
                        <label for="datum_eerstvolgende_levering" class="block">Datum eerstvolgende levering</label>
                        <input type="date" id="datum_eerstvolgende_levering" name="datum_eerstvolgende_levering" value="{{ old('datum_eerstvolgende_levering') }}" required class="w-full border rounded px-2 py-1">
                        @error('datum_eerstvolgende_levering')
                            <p class="text-red-600 text-sm">{{ $message }}</p>
                        @enderror
                    </div>

                    <div class="flex gap-2">
                        <button type="submit" class="px-4 py-2 border rounded hover:bg-gray-100">Sla op</button>
                        <a href="{{ route('leverancier.producten', $info['LeverancierId']) }}" class="px-4 py-2 border rounded hover:bg-gray-100 ml-auto">Terug</a>
                        <a href="{{ route('dashboard') }}" class="px-4 py-2 border rounded hover:bg-gray-100">Home</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
</x-app-layout>
