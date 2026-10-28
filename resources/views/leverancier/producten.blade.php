<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">
            Geleverde producten
        </h2>
    </x-slot>

    @if (count($producten) === 0)
        <meta http-equiv="refresh" content="3;url={{ route('leverancier.overzicht') }}">
    @endif

    <div class="py-12">
        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
            <div class="bg-white overflow-hidden shadow-sm sm:rounded-lg p-6">

                <div class="mb-4">
                    <p>Naam leverancier: {{ $leverancierInfo['Naam'] }}</p>
                    <p>Contactpersoon: {{ $leverancierInfo['ContactPersoon'] }}</p>
                    <p>Leverancier NR: {{ $leverancierInfo['LeverancierNummer'] }}</p>
                    <p>Mobiel: {{ $leverancierInfo['Mobiel'] }}</p>
                </div>

                <table class="w-full text-left border-collapse">
                    <thead>
                        <tr class="border-b">
                            <th class="p-2">Naam product</th>
                            <th class="p-2">Aantal in magazijn</th>
                            <th class="p-2">Verpakkingseenheid</th>
                            <th class="p-2">Laatste levering</th>
                            <th class="p-2">Nieuwe levering</th>
                        </tr>
                    </thead>
                    <tbody>
                        @forelse ($producten as $product)
                            <tr class="border-b">
                                <td class="p-2">{{ $product['NaamProduct'] }}</td>
                                <td class="p-2">{{ $product['AantalAanwezig'] ?? 0 }}</td>
                                <td class="p-2">{{ (float) $product['VerpakkingsEenheidInKilogram'] }} kg</td>
                                <td class="p-2">{{ \Carbon\Carbon::parse($product['LaatsteLevering'])->format('d-m-Y') }}</td>
                                <td class="p-2 text-xl font-bold text-red-600">+</td>
                            </tr>
                        @empty
                            <tr class="border-b">
                                <td class="p-2 text-center" colspan="5">Dit bedrijf heeft tot nu toe geen producten geleverd aan Jamin</td>
                            </tr>
                        @endforelse
                    </tbody>
                </table>

                <div class="mt-4 flex justify-end gap-2">
                    <a href="{{ route('leverancier.overzicht') }}" class="px-4 py-2 border rounded hover:bg-gray-100">Terug</a>
                    <a href="{{ route('dashboard') }}" class="px-4 py-2 border rounded hover:bg-gray-100">Home</a>
                </div>
            </div>
        </div>
    </div>
</x-app-layout>
